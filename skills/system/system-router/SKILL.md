# System Router

ก่อนตอบหรือทำงานทุกครั้ง ต้องระบุ target system + target machine ให้ชัดก่อนลงมือ

## Target Systems — แยกชัดเจน

| System | Role | สถานะ |
|---|---|---|
| **OpenClaw** | runtime/gateway/bot process หลัก — ต่างหากจาก Hermes | ❌ Do-Not-Touch |
| **Hermes** | worker/sync/maintenance node | ✅ Hermes-Mac หรือ Hermes-PC |
| **Owenzzz_bot** | GitHub shared brain repo — เก็บ docs, skills, memories | ✅ แก้ได้ |
| **OwenGPT** | architect/planner — GPT-5.5 Thinking ใน ChatGPT | ✅ สั่งงานได้ |

## Owenzzz_bot — ต้องแยกจาก OpenClaw ชัดเจน

**Owenzzz_bot คือ:**
- GitHub repo: `github.com/apinanautan/Owenzzz_bot`
- เก็บ shared brain files: `docs/`, `skills/`, `memories/`, `AGENTS.md`, `SOUL.md`
- เป็น **เอกสาร/ความรู้** ไม่ใช่ runtime

**Owenzzz_bot ไม่ใช่:**
- ❌ ไม่ใช่ OpenClaw runtime
- ❌ ไม่ใช่ Hermes node
- ❌ ไม่ใช่ Owen (บุคคล) — แม้ชื่อจะคล้ายกัน
- ❌ ไม่ใช่ bot process
- ❌ ไม่ใช่ gateway หรือ Telegram bot

## Target Machines

| Machine | Indicators |
|---|---|
| **PC** | Windows, WSL, DESKTOP, /mnt/c, /home/apinan |
| **Mac** | Darwin, /Users/apaut, mac-main |

## Combined Targets

สูตร: `[System]-[Machine]` เช่น:
- `Hermes-Mac` — Hermes orchestrator บน Mac ✅
- `Hermes-PC` — Hermes worker บน PC ✅
- `Owenzzz_bot` — shared brain repo (ไม่มี machine) ✅

**ห้ามใช้:** `OpenClaw-PC`, `OpenClaw-Mac` — อยู่นอก scope (Do-Not-Touch)

## Routing Rules

| Keywords | Target |
|---|---|
| polling, Telegram stall, gateway, process, PID, bot runtime | ❌ ห้าม route — อยู่นอก scope |
| ~/.hermes, sync worker, brain-preflight, brain-autopush | `Hermes-[machine]` |
| GitHub repo, skills, memories, AGENTS.md, SOUL.md, docs | `Owenzzz_bot` |
| แผน, architecture, สั่ง Hermes/OpenClaw | `OwenGPT` |

## Machine Rules

- ถ้าพูดถึง Windows, WSL, DESKTOP, /mnt/c, /home/apinan → PC
- ถ้าพูดถึง Mac, Darwin, /Users/apaut, mac-main → Mac
- ถ้าไม่ชัด ต้องถาม/หรือแยกความเป็นไปได้ก่อน
- ห้ามเอา path/config/token ของ Mac ไปใส่ PC
- ห้ามเอา path/config/token ของ PC ไปใส่ Mac

## Critical Rules

1. **ห้าม assume** ว่าทุกงานคือ OpenClaw หรือ Hermes
2. **ก่อนแก้ไฟล์** ต้องบอกก่อนว่า target คือ `[System]-[Machine]`
3. **ห้ามปน** path/config/token ข้าม system/machine
4. **ถ้าไม่ชัด** → หยุดและ route งานก่อน ห้ามเดา
5. **ห้ามสั่ง** OpenClaw ทำอะไรโดยไม่ระบุ machine
6. **ห้าม route** งานไป OpenClaw runtime ตาม Do-Not-Touch scope

## Workflow

```
เห็นงาน → แยก system + machine → ถามถ้าไม่ชัด → ทำงาน → รายงาน target
```

ถ้าเจ้านายสั่งแบบไม่ระบุ system → ถามก่อนทำ