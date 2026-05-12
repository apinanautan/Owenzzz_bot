# System Router

ก่อนตอบหรือทำงานทุกครั้ง ต้องระบุ target system + target machine ให้ชัดก่อนลงมือ

## Compact Target Names (ใช้แทน System-Machine)

| ชื่อเล่น | System | Machine | ความหมาย |
|---|---|---|---|
| `[เมท-PC]` | Hermes | PC | Hermes worker บน Windows/WSL |
| `[เมท-Mac]` | Hermes | Mac | Hermes worker บน Mac |
| `[โอเว่น-PC]` | OpenClaw | PC | OpenClaw runtime บน PC |
| `[โอเว่น-Mac]` | OpenClaw | Mac | OpenClaw runtime บน Mac |
| `Owenzzz_bot` | — | GitHub | shared brain repo (ใช้ตรง ๆ) |
| `OwenGPT` | — | ChatGPT | architect/planner |

## Routing Rules

| Keywords | Target |
|---|---|
| polling, Telegram stall, gateway, process, PID, bot runtime | `[โอเว่น-PC]` หรือ `[โอเว่น-Mac]` |
| ~/.hermes, sync worker, brain-preflight, brain-autopush | `[เมท-PC]` หรือ `[เมท-Mac]` |
| GitHub repo, skills, memories, AGENTS.md, SOUL.md, docs | `Owenzzz_bot` |
| แผน, architecture, สั่ง Hermes/OpenClaw | `OwenGPT` |

## Machine Rules

- ถ้าพูดถึง Windows, WSL, DESKTOP, /mnt/c, /home/apinan → `[เมท-PC]` หรือ `[โอเว่น-PC]`
- ถ้าพูดถึง Mac, Darwin, /Users/apaut, mac-main → `[เมท-Mac]` หรือ `[โอเว่น-Mac]`
- ถ้าไม่ชัด ต้องถาม/หรือแยกความเป็นไปได้ก่อน
- ห้ามเอา path/config/token ของ Mac ไปใส่ PC
- ห้ามเอา path/config/token ของ PC ไปใส่ Mac

## Critical Rules

1. **ห้ามใช้** `Target: (System)-[Machine]` — ใช้ `[ชื่อเล่น-Machine]` แทน
2. **ห้าม assume** ว่าทุกงานคือ `[เมท-...]` หรือ `[โอเว่น-...]`
3. **ก่อนแก้ไฟล์** ต้องบอกก่อนว่า target คือ `[ชื่อเล่น-Machine]`
4. **ห้ามปน** path/config/token ข้าม system/machine
5. **ถ้าไม่ชัด** → หยุดและ route งานก่อน ห้ามเดา

## Workflow

```
เห็นงาน → แยก system + machine → ใช้ [ชื่อเล่น-Machine] → ถามถ้าไม่ชัด → ทำงาน → รายงาน
```