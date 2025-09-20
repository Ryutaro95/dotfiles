---
allowed-tools: Read, TodoWrite
description: Show current task progress and manage task execution (Enhanced with progress tracking)
---

## Context

- Task file: @.tmp/tasks.md
- Current project progress

## Your task

### 1. Check for tasks.md

- If `.tmp/tasks.md` exists, show progress
- If not, inform user to run `/requirements`, `/design`, then task breakdown first

### 2. Show current progress

Display current progress in the following format:

```
📊 Overall Progress: X/Y completed (Z%)
🎯 Current Phase: [Phase name]
🔄 Active Task: [Current task] 
⏳ Next Task: [Next task to execute]
```

### 3. Parse task status

Read tasks.md and identify:
- Completed tasks (✅)
- Current task (🔄 or ⏳ "次に実行")
- Waiting tasks (⏸️)
- Failed tasks (❌)

### 4. Provide actionable next steps

Show exactly what needs to be done next:
- Specific files to create/modify
- Commands to run
- Expected outcomes

### 5. Update todo tracking

Use TodoWrite to sync with the current task status from tasks.md

## Status Icons Reference

- ✅ Completed
- 🔄 In Progress  
- ⏳ Next (Ready to start / 次に実行)
- ⏸️ Waiting (Dependencies not met)
- ❌ Failed
- 🚧 Blocked

## Task ID Format

Tasks use: `[Phase].[Task].[SubTask]` (e.g., 2.1.3 = Phase 2, Task 1, SubTask 3)

## Example Output

```
📊 TDD Progress: 4/30 completed (13.3%)
🎯 Current Phase: フェーズ2: データモデル層
🔄 Active Task: 2.1 Taskモデル実装 ✅ COMPLETED
⏳ Next Task: 2.2.1 RED: Enum型テスト

📋 Next Steps:
1. Add enum validation tests to internal/model/task_test.go
2. Run: go test -v ./internal/model/ (should fail)
3. Implement basic Status/Priority methods
```

## Usage Instructions

When user runs `/tasks`:
1. Parse .tmp/tasks.md progress markers
2. Calculate completion percentage
3. Identify current and next tasks
4. Show specific actionable steps
5. Update TodoWrite to match tasks.md status

## Implementation Notes

- Read entire tasks.md to understand current state
- Look for "【次のタスク】" and "【次に実行】" markers
- Count ✅ vs total tasks for progress
- Provide file paths and command examples for next steps
- Keep TodoWrite in sync with actual progress

think hard

