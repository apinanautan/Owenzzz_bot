# Owen Brain — Architecture & Setup Guide

## Overview
Unified brain for OpenClaw running on Windows/WSL2 (primary) and MacBook (secondary/future).

## Repository Structure
```
Owenzzz_bot/
├── .openclaw/              # Shared brain (skills, prompts, agents)
│   ├── skills/             # OpenClaw skill definitions
│   ├── prompts/            # System prompts
│   └── agents/             # Agent configs
├── configs/
│   ├── devices/            # Per-device JSON configs
│   │   ├── windows-wsl2.json
│   │   └── macbook.json
│   └── shared/             # Shared config (no secrets)
├── scripts/
│   ├── device-detect.sh    # Auto-detect current machine
│   ├── sync.sh             # Pull/push brain from GitHub
│   └── setup-device.sh     # First-time setup
├── docs/
├── AGENTS.md               # Reply flow rules
├── SOUL.md                 # Persona
├── IDENTITY.md             # Identity
├── MEMORY.md               # Long-term memory
├── USER.md                 # User profile
├── OWEN_FLOW_SPEC.md       # Full reply specification
└── TOOLS.md                # Local tool paths
```

## Device Roles
| Device        | Role       | GPU | Windows Auto | Chat |
|---------------|------------|-----|--------------|------|
| Windows WSL2  | PRIMARY    | ✅  | ✅           | ✅   |
| MacBook       | SECONDARY  | ❌  | ❌           | ✅   |

## Setup — New Device
```bash
git clone https://github.com/apinanautan/Owenzzz_bot.git
cd Owenzzz_bot
./scripts/setup-device.sh
# Edit .env.local with secrets
./scripts/sync.sh pull
```

## Sync Workflow
```bash
./scripts/sync.sh pull   # Pull brain from GitHub
./scripts/sync.sh push   # Push local changes (requires review)
./scripts/sync.sh status # Show current status
```

## What is NOT synced (local only)
- `.env.local` — Telegram token, API keys
- `*.log` — Logs
- `*.db` — Databases
- `cache/` — Cache files
- `node_modules/` — Dependencies

## Active Device Detection
On startup, OpenClaw reads `DEVICE_NAME` or runs `hostname` to determine its role.
Config is loaded from `configs/devices/{DEVICE_ID}.json`.