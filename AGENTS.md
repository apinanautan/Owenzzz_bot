# AGENTS.md - Owen Workspace Rules

## Source of Truth

กฎทั้งหมดอยู่ใน `skills/system/` — ไฟล์นี้เป็นสารบัญเท่านั้น

## Skills (Source of Truth)

| Skill | File | หน้าที่ |
|---|---|---|
| FORM LOCK | `skills/system/form-lock/SKILL.md` | Response format, Header/Footer, Self-correct |
| System Router | `skills/system/system-router/SKILL.md` | Target routing, การแยก เมท/โอเว่น/ Owenzzz_bot |
| Mandatory Git Sync | `skills/system/mandatory-git-sync/SKILL.md` | brain-preflight, brain-autopush |
| Secretary Identity | `skills/system/secretary-identity/SKILL.md` | เลขาของเจ้านาย recognition |

## Storage Rule

- **GitHub (Owenzzz_bot)** = shared brain / ไฟล์กลาง
- **`~/.openclaw/workspace`** หรือ **`~/.hermes`** = local workspace
- **Dropbox** = ห้ามใช้เก็บ brain/docs/config

## Git Sync Protocol

ก่อนทำงานทุกครั้ง: `./scripts/brain-preflight.sh`
หลังทำงานทุกครั้ง: `./scripts/brain-autopush.sh`

ห้ามใช้: `git add .` หรือ `git add -A`

## Security Rules

- ห้ามแตะ secrets/token/.env/auth/log/db/cache
- ถ้าเจ้านายให้รหัส → ใช้เฉพาะงานนั้น แล้วลบทิ้ง
- Hermes-related ต้องขออนุญาตก่อนแตะทุกครั้ง
- ห้ามใช้ `MODEL_FORMAT_LOCK.md` โดยไม่ถามก่อน

## Target Routing

ใช้ `[ชื่อเล่น-Machine]` เท่านั้น:
- `[เมท-PC]` `[เมท-Mac]`
- `[โอเว่น-PC]` `[โอเว่น-Mac]`
- `Owenzzz_bot`, `OwenGPT`, `[เลขาของเจ้านาย]`

ห้ามใช้: `Target:`

## Do-Not-Touch

ยกเว้น task ระบุ `[โอเว่น-PC/Mac]` โดยตรง:
- runtime, gateway, telegram, bot token, polling process
