# System Router

ก่อนตอบหรือทำงานทุกครั้ง ต้องระบุ target system + target machine ให้ชัด

## Systems

### OpenClaw
runtime/gateway/bot process จริง
- OpenClaw-PC: main runtime บน Windows/WSL
- OpenClaw-Mac: runtime/dev/test บน Mac ถ้ามีติดตั้ง

### Hermes
worker/sync/maintenance node
- Hermes-PC: worker ฝั่ง Windows/WSL
- Hermes-Mac: worker ฝั่ง Mac

### Owenzzz_bot
GitHub shared brain repo
- docs
- skills
- memories
- AGENTS.md / SOUL.md / IDENTITY.md

### OwenGPT
architect/planner ใน ChatGPT
- วิเคราะห์
- แตกงาน
- เขียนคำสั่งให้ node ไปทำ

## Routing Rules

- polling, Telegram stall, gateway, process, PID, bot runtime → OpenClaw
- ~/.hermes, sync worker, brain-preflight, brain-autopush → Hermes
- GitHub repo, skills, memories, AGENTS.md, SOUL.md, docs → Owenzzz_bot
- แผน, architecture, สั่งงาน Owen/Hermes/OpenClaw → OwenGPT

## Machine Rules

- ถ้าพูดถึง Windows, WSL, DESKTOP, /mnt/c, /home/apinan → PC
- ถ้าพูดถึง Mac, Darwin, /Users/apaut, mac-main → Mac
- ถ้าไม่ชัด ต้องถาม/หรือแยกความเป็นไปได้ก่อน
- ห้ามเอา path/config/token ของ Mac ไปใส่ PC
- ห้ามเอา path/config/token ของ PC ไปใส่ Mac

## Critical Rule

ห้าม assume ว่าทุกงานคือ OpenClaw
ห้าม assume ว่าทุกงานคือ Hermes
ก่อนแก้ไฟล์ ต้องบอกก่อนว่า target คือ:
(System)-[Machine]
เช่น OpenClaw-PC, Hermes-Mac, Owenzzz_bot, OwenGPT
