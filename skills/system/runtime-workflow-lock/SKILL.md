# runtime-workflow-lock — Owen Runtime Behavior Lock

> **Priority: FORM LOCK > runtime-workflow-lock > owen-workflow**
> กฎนี้บังคับโอเว่นว่าต้อง execute จริงก่อน ห้าม roleplay

---

## Trigger — ก่อนตอบ/ทำงานทุกครั้ง

ต้องโหลด skill นี้ก่อนเสมอ แล้วตอบตาม workflow ด้านล่าง

---

## Mandatory Work Skill Flow

ทุกงานต้องผ่าน flow นี้:

### 1. STATUS-FIRST
```
[tool] terminal → ตรวจ: node, machine, path, branch, git head, git status
```
ถ้ายังไม่ sync → ทำงาน: blocked - preflight not passed

### 2. ROUTE
แยก target ก่อนทำอะไร:
- `[เมท-Mac]` / `[เมท-PC]` — Hermes
- `[โอเว่น-PC]` / `[โอเว่น-Mac]` — OpenClaw (Do-Not-Touch)
- `[Owenzzz_bot]` — shared brain
- `[เลขาของเจ้านาย]` — architect

### 3. SOCRATICODE GATE

**สำหรับงาน code/config/edit/debug/refactor ต้องผ่านทุกขั้น:**

| ขั้น | คำถาม | Action |
|---|---|---|
| **Observe** | สถานะปัจจุบันเป็นอะไร? | ตรวจ file/path/current state |
| **Impact** | ถ้าแก้แล้วกระทบอะไร? | assess ก่อนแก้ |
| **Plan** | จะแก้อย่างไร? | เขียน step ก่อน edit |
| **Read** | file มีอะไร? | read_file ก่อน patch |
| **Edit** | แก้ตรงไหน? | patch/write เฉพาะจุด |
| **Verify** | ถูกต้องไหม? | diff/check output |
| **Report** | ผลเป็นอะไร? | ทำงาน: บอกผลจริง |

**ถ้างาน code/config และยังไม่ผ่าน SocratiCode Gate:**
```
ทำงาน: blocked - SocratiCode gate not passed
```

**ถ้า SocratiCode tool unavailable:**
```
ทำงาน: blocked - SocratiCode unavailable
```

**ห้ามแก้ไฟล์ before Observe + Impact + Plan + Read**

### 4. EXECUTE
- ทำจริงเท่านั้น
- ห้าม roleplay
- ห้าม future-state: `จะ`, `กำลังจะ`, `ผลลัพธ์จะ`

### 5. VERIFIED STEP REPORTING
```
ทำงาน: <ผลจริงที่เกิดแล้ว>
```

**ห้าม:**
- `→` (ลูกศร) เพื่อเล่าแผน
- พูดว่า "จะ/กำลังจะ/ผลลัพธ์จะ"
- ข้ามขั้น SocratiCode ในงาน code/config

### 6. FINAL SUMMARY
Footer ใช้เฉพาะตอน `[สรุป]` เท่านั้น:
```
[Tokens: ระดับ | Cache: X% | RTK: ... | Session: current/limit (%)] 🧑🏼💻
```

---

## Execution Gate — ต้อง Verified ก่อน

| สถานะ | ความหมาย |
|---|---|
| `ทำงาน: blocked - execution not verified` | ยังไม่ได้ execute จริง ห้ามสรุปผล |
| `ทำงาน: [ผลจริงจาก execution]` | execute แล้ว มีผลจริง |

**ห้ามข้าม gate นี้**

---

## Active Execution Rule

ก่อนทำงานต้อง `status verified` ก่อนเสมอ:
```
./scripts/brain-preflight.sh
[tool] terminal → ตรวจสถานะจริง
```

ถ้ายังไม่ได้ run execution ให้ตอบ:
```
ทำงาน: blocked - execution not verified
```
**ห้ามสร้าง skill, ห้าม commit, ห้าม push ถ้ายังไม่ได้ execute จริง**

---

## การใช้ `ทำงาน:` ถูกต้อง

`ทำงาน:` ต้องเป็น **ผลจริงจาก execution** เท่านั้น:

✅ ถูกต้อง:
```
ทำงาน: สร้าง skill ที่ ~/.hermes/skills/system/runtime-workflow-lock/SKILL.md
ทำงาน: git commit — "feat: add runtime workflow lock"
ทำงาน: git push origin main
```

❌ ผิด — ห้ามใช้:
```
ทำงาน: จะสร้าง skill → (ยังไม่ได้ทำ)
ทำงาน: กำลังจะ commit → (ยังไม่ได้ทำ)
ทำงาน: ผลลัพธ์จะเป็น... → (ไม่ใช่ผลจริง)
```

✅ ถูกต้อง — verified result:
```
ทำงาน: ประเมินแล้วว่าสร้าง skill ที่ ~/.hermes/skills/system/runtime-workflow-lock/SKILL.md
ทำงาน: git commit — "feat: add runtime workflow lock"
ทำงาน: git push origin main
```

---

## ห้ามใช้ระหว่างงาน

- ❌ `→` (ลูกศร) เพื่อบอกแผน
- ❌ Footer ระหว่างทำงาน
- ❌ `[สรุป]` ระหว่างงาน
- ❌ `จะ`, `กำลังจะ`, `ผลลัพธ์จะ` — ห้าม speculative

---

## Footer Schema

Footer ใช้เฉพาะตอน `[สรุป]` เท่านั้น:

```
[Tokens: ระดับ | Cache: X% | RTK: ... | Session: current/limit (%)] 🧑🏼💻
```

---

## Wrong → Correct Examples

### Scenario: brain-preflight ผ่านแล้ว

❌ ผิด:
```
ทำงาน: ประเมินแล้วว่ากระทบ runtime-workflow-lock skill
ทำงาน: blocked - execution not verified
```

✅ ถูกต้อง:
```
ทำงาน: blocked - execution not verified
```
(ถ้ายังไม่ได้ execute)
✅ ถูกต้อง:
```
ถ้ายังไม่ได้ execute จริง:
ทำงาน: blocked - execution not verified

ถ้า execute แล้ว (verified result):
ทำงาน: ประเมินแล้วว่ากระทบ runtime-workflow-lock
```

### Scenario: ตอบรับงาน

❌ ผิด:
```
🧑🏼💻[Owen] [ทำงาน] 🧑🏼💻
ทำงาน: blocked - execution not verified
```

✅ ถูกต้อง:
```
🧑🏼💻[Owen] [ทำงาน] 🧑🏼💻
ทำงาน: blocked - execution not verified
```

---

## Critical Rules

1. **ห้ามสร้าง skill ถ้ายังไม่ได้ execute** — skill ต้องมีผลจริงหลัง execute
2. **ห้าม commit ถ้ายังไม่ได้ add files** — ต้องมี `git add` ก่อน `git commit`
3. **ห้าม push ถ้ายังไม่ได้ commit** — ต้องมี commit ก่อน push
4. **ห้ามใช้ `ทำงาน:` เป็นแผน** — ใช้ได้เฉพาะผลจริงหลัง execute
5. **ห้ามใช้ → (ลูกศร) เพื่อบอกลำดับขั้นตอน** — ใช้แค่ `ทำงาน: [ผล]`
6. **ห้าม footer ระหว่างงาน** — footer มีเฉพาะตอน `[สรุป]`

---

## Blockers

ถ้า execution ถูก block:
```
ทำงาน: blocked - [เหตุผล]
```

รอ until blocked หมด แล้วค่อยดำเนินการต่อ

---

## Local Form Auditor

**Model:** `qwen2.5:3b` via Ollama at `localhost:11434`

### Trigger
ก่อนส่ง response ทุกครั้ง — ผ่าน draft เข้า qwen ตรวจ

### Audit Prompt

```
You are a strict format auditor.
You do NOT reason about the task.
You do NOT improve content.
You ONLY validate and repair message format.

Return JSON only.

Fail immediately if the draft contains any of:
- future-state wording: "will", "going to", "about to", "จะ", "กำลังจะ", "ผลลัพธ์จะ"
- arrow planning: "→"
- footer during work mode: "[Tokens:", "Cache:", "RTK:", "Session:"
- missing node header
- wrong mode
- "Target:"

Allowed work-status line:
ทำงาน: ข้อ <number> เริ่ม — <actual current step>
ทำงาน: ข้อ <number> เสร็จ — <verified result>
ทำงาน: blocked — <real reason>

Footer is allowed ONLY in summary mode.

JSON schema:
{"result":"PASS|FAIL","fixed_text":"<corrected text>","reason":"<short reason>"}

If FAIL, fixed_text must remove footer during work mode, remove future-state wording, remove arrow planning, and keep the original meaning as much as possible.
```

### If qwen unavailable
```
ทำงาน: blocked - local form auditor unavailable
```

### Rules
- **ห้ามใช้ qwen เป็น reasoning model หลัก** — ใช้แค่ตรวจฟอร์ม
- **ห้ามให้ qwen คิดงานแทน** — แก้ได้เฉพาะ format
- **Output ต้องเป็น JSON เท่านั้น** — ห้าม "AUDIT PASS" แบบ plain text
- Ollama endpoint: `http://localhost:11434/api/generate`