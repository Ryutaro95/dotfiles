# Add Issue Command

## Description
ユーザーが発見したアプリケーションの問題点をToDoリストに追加し、そのタスクに対応するrequirements、design、tasksファイルを自動生成するコマンド

## Usage
```
/add_issue [問題点の説明]
```

## Example
```
/add_issue タスクリストでの日本語入力が正しく動作しない
```

## Behavior
1. 指定された問題点をToDoリストに追加
2. `.tmp/requirements_[タスクID].md` ファイルを生成
3. `.tmp/design_[タスクID].md` ファイルを生成
4. `.tmp/tasks_[タスクID].md` ファイルを生成
5. 各ファイルに問題点に関連する詳細な内容を記述

## Parameters
- `issue_description`: 問題点の説明（必須）

## Output Files
- Requirements document with detailed analysis
- Design document with technical approach
- Tasks document with implementation steps