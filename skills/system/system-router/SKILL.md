# System Router

ก่อนตอบหรือทำงานทุกครั้ง ต้องระบุ target ให้ชัดก่อนลงมือ

## Compact Target Names

| ชื่อเล่น | System | ความหมาย |
|---|---|---|
| `[เมท-PC]` | Hermes | sync/bootstrap/git/MCP/maintenance บน PC |
| `[เมท-Mac]` | Hermes | sync/bootstrap/git/MCP/maintenance บน Mac |
| `[โอเว่น-PC]` | OpenClaw | runtime/gateway/Telegram/process บน PC |
| `[โอเว่น-Mac]` | OpenClaw | runtime/gateway/Telegram/process บน Mac |
| `Owenzzz_bot` | — | GitHub shared brain repo (docs/skills/memories) |
| `OwenGPT` | — | architect/planner ใน ChatGPT |

## การตีความ Owenzzz_bot vs โอเว่น

**Owenzzz_bot** = เอกสาร/ความรู้/shared-brain เท่านั้น
- GitHub repo: `github.com/apinanautan/Owenzzz_bot`
- เก็บ: docs/, skills/, memories/, AGENTS.md, SOUL.md
- **ห้ามตีความว่า** = โอเว่น/OpenClaw

**โอเว่น** = runtime/gateway/Telegram/process เท่านั้น
- gateway, bot process, Telegram polling, bot token
- **ห้ามตีความว่า** = Owenzzz_bot

## Do-Not-Touch (ห้ามแตะโดยตรง)

- runtime
- gateway
- telegram
- bot token
- polling process

ยกเว้น: task ระบุ `[โอเว่น-PC]` หรือ `[โอเว่น-Mac]` โดยตรงเท่านั้น

## Routing Rules

| Keywords | Target |
|---|---|
| polling, Telegram stall, gateway, process, PID, bot runtime | `[โอเว่น-PC]` หรือ `[โอเว่น-Mac]` |
| ~/.hermes, sync worker, brain-preflight, brain-autopush, git, MCP | `[เมท-PC]` หรือ `[เมท-Mac]` |
| GitHub repo, skills, memories, AGENTS.md, SOUL.md, docs | `Owenzzz_bot` |
| แผน, architecture, สั่ง Hermes/OpenClaw | `OwenGPT` |

## Machine Rules

- Windows, WSL, DESKTOP, /mnt/c, /home/apinan → `[เมท-PC]` หรือ `[โอเว่น-PC]`
- Mac, Darwin, /Users/apaut → `[เมท-Mac]` หรือ `[โอเว่น-Mac]`
- ไม่ชัด → ถามก่อน ห้าม assume

## Behavior Rules

- task ระบุ `Owenzzz_bot` → ทำเฉพาะ repo/docs/skills/memory
- task ระบุ `[โอเว่น-PC/Mac]` → ถึงค่อยแตะ runtime/process
- ไม่ชัด → ถามก่อน ห้าม assume

## Critical Rules

1. ห้ามใช้ `Target:` — ใช้ `[ชื่อเล่น-Machine]`
2. ห้าม assume ว่าทุกงานคือ โอเว่น หรือ เมท
3. ห้ามปน path/config/token ข้าม system/machine
4. ถ้าไม่ชัด → หยุดและถามก่อน
