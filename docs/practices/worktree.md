# Git Worktrees — Parallel Development

## What & Why
Worktrees let you check out multiple branches simultaneously in separate directories.
Use them for: parallel feature development, isolating experiments, running agents on branches without disturbing main.

## Setup
```bash
# From inside your main repo
git worktree add ../CRISPAI-<PROJECT>-wt-<feature> feature/<feature-branch>

# Or create a new branch in the worktree
git worktree add -b feature/<feature-branch> ../CRISPAI-<PROJECT>-wt-<feature>
```

## Claude Code Worktree (Isolated Agent Work)
Claude Code can run agents in isolated worktrees via the Agent tool with `isolation: "worktree"`.
- Agent gets a temporary git worktree copy
- Worktree is auto-cleaned if no changes are made
- If changes are made, worktree path + branch are returned

Trigger from `CLAUDE.md` or agent prompt:
```
Use isolation: "worktree" for any risky refactor or experimental agent run.
```

## Listing & Cleanup
```bash
git worktree list            # see all active worktrees
git worktree remove <path>   # remove when done
git worktree prune           # clean up stale entries
```

## Branch Naming Convention
```
feature/<phase>-<short-description>
fix/<issue-number>-<short-description>
experiment/<name>
```

## PR Convention
- One issue + one PR per phase/feature
- PRs must pass `make verify-<phase>` before merge
- Squash merge to keep main history clean
