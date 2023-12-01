if status is-interactive
    # Commands to run in interactive sessions can go here
end
set PATH /opt/homebrew/bin $PATH

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Rust
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin

abbr -a vim nvim
abbr -a ll exa -la --icons
abbr -a cat bat -p
abbr -a tree exa -la --icons -T
abbr -a dcm docker-compose
abbr -a ssh-gcloud gcloud compute ssh --zone asia-northeast1-b ryutaro-instance-1 --project skillful-skill-394710
abbr -a gs git status
abbr -a ga git add -A
abbr -a gc git commit
abbr -a dc docker compose

# rbenv
status --is-interactive; and rbenv init - fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryutaro/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/ryutaro/Downloads/google-cloud-sdk/path.fish.inc'
end
