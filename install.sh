#!/bin/bash

# dotfiles installer script
# Creates symbolic links from dotfiles to home directory

set -e

# Color definitions for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

# Function to print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create symbolic link
create_symlink() {
    local source_path="$1"
    local target_path="$2"

    # Create target directory if it doesn't exist
    local target_dir="$(dirname "$target_path")"
    if [[ ! -d "$target_dir" ]]; then
        print_info "Creating directory: $target_dir"
        mkdir -p "$target_dir"
    fi

    # Check if target already exists
    if [[ -L "$target_path" ]]; then
        # If it's already a symlink, check if it points to the right place
        if [[ "$(readlink "$target_path")" == "$source_path" ]]; then
            print_info "Symlink already exists and is correct: $target_path"
            return 0
        else
            print_warning "Removing existing symlink: $target_path"
            rm "$target_path"
        fi
    elif [[ -e "$target_path" ]]; then
        # If it's a regular file/directory, ask user what to do
        print_warning "Target already exists: $target_path"
        read -p "Do you want to backup and replace it? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_info "Backing up existing file to ${target_path}.backup"
            mv "$target_path" "${target_path}.backup"
        else
            print_info "Skipping: $target_path"
            return 0
        fi
    fi

    # Create the symlink
    print_info "Creating symlink: $target_path -> $source_path"
    ln -s "$source_path" "$target_path"
}

# Main installation function
install_dotfiles() {
    print_info "Starting dotfiles installation from $DOTFILES_DIR"

    # Install .config directory contents
    if [[ -d "$DOTFILES_DIR/.config" ]]; then
        print_info "Installing .config files..."

        # Process each subdirectory in .config
        for config_dir in "$DOTFILES_DIR/.config"/*; do
            if [[ -d "$config_dir" ]]; then
                local dir_name="$(basename "$config_dir")"
                create_symlink "$config_dir" "$HOME_DIR/.config/$dir_name"
            fi
        done
    fi

    # Install other dotfiles (files starting with .)
    print_info "Installing other dotfiles..."

    # Common dotfiles to symlink (add more as needed)
    local dotfiles=(
        ".gitconfig"
        ".gitignore_global"
        ".bashrc"
        ".bash_profile"
        ".zshrc"
        ".profile"
        ".vimrc"
        ".tmux.conf"
    )

    for dotfile in "${dotfiles[@]}"; do
        if [[ -f "$DOTFILES_DIR/$dotfile" ]]; then
            create_symlink "$DOTFILES_DIR/$dotfile" "$HOME_DIR/$dotfile"
        fi
    done

    print_info "Dotfiles installation completed!"
}

# Function to show help
show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -l, --list     List all files that would be symlinked"
    echo "  -u, --uninstall Remove all symlinks"
    echo ""
    echo "This script creates symbolic links from the dotfiles repository"
    echo "to the appropriate locations in your home directory."
}

# Function to list files that would be symlinked
list_files() {
    print_info "Files that would be symlinked:"

    # List .config directories
    if [[ -d "$DOTFILES_DIR/.config" ]]; then
        for config_dir in "$DOTFILES_DIR/.config"/*; do
            if [[ -d "$config_dir" ]]; then
                local dir_name="$(basename "$config_dir")"
                echo "  $config_dir -> $HOME_DIR/.config/$dir_name"
            fi
        done
    fi

    # List other dotfiles
    local dotfiles=(
        ".gitconfig"
        ".gitignore_global"
        ".bashrc"
        ".bash_profile"
        ".zshrc"
        ".profile"
        ".vimrc"
        ".tmux.conf"
    )

    for dotfile in "${dotfiles[@]}"; do
        if [[ -f "$DOTFILES_DIR/$dotfile" ]]; then
            echo "  $DOTFILES_DIR/$dotfile -> $HOME_DIR/$dotfile"
        fi
    done
}

# Function to uninstall (remove symlinks)
uninstall_dotfiles() {
    print_info "Removing dotfiles symlinks..."

    # Remove .config symlinks
    if [[ -d "$HOME_DIR/.config" ]]; then
        for config_dir in "$DOTFILES_DIR/.config"/*; do
            if [[ -d "$config_dir" ]]; then
                local dir_name="$(basename "$config_dir")"
                local target_path="$HOME_DIR/.config/$dir_name"
                if [[ -L "$target_path" ]] && [[ "$(readlink "$target_path")" == "$config_dir" ]]; then
                    print_info "Removing symlink: $target_path"
                    rm "$target_path"
                fi
            fi
        done
    fi

    # Remove other dotfile symlinks
    local dotfiles=(
        ".gitconfig"
        ".gitignore_global"
        ".bashrc"
        ".bash_profile"
        ".zshrc"
        ".profile"
        ".vimrc"
        ".tmux.conf"
    )

    for dotfile in "${dotfiles[@]}"; do
        local target_path="$HOME_DIR/$dotfile"
        if [[ -L "$target_path" ]] && [[ "$(readlink "$target_path")" == "$DOTFILES_DIR/$dotfile" ]]; then
            print_info "Removing symlink: $target_path"
            rm "$target_path"
        fi
    done

    print_info "Dotfiles uninstallation completed!"
}

# Parse command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    -l|--list)
        list_files
        exit 0
        ;;
    -u|--uninstall)
        uninstall_dotfiles
        exit 0
        ;;
    "")
        install_dotfiles
        ;;
    *)
        print_error "Unknown option: $1"
        show_help
        exit 1
        ;;
esac