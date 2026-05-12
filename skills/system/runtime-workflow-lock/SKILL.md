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

### 5. VERIFIED STEP REPORTING (Realtime Work Progress)

**ต้องรายงานความคืบหน้าแบบเรียลไทม์ ทุกข้อต้องมี status line แยกกัน**

Format ระหว่างทำงาน (1 บรรทัด = 1 สถานะ):
```
ทำงาน: ข้อ <number> เริ่ม — <กำลังทำอะไร>
ทำงาน: ข้อ <number> เสร็จ — <ผลที่ทำเสร็จจริง>
ทำงาน: blocked — <เหตุผลที่ทำต่อไม่ได้>
```

**กฎ:**
- "เริ่ม" ใช้ตอนเริ่มทำข้อนั้นจริง
- "เสร็จ" ใช้เมื่อมีผลจริงแล้วเท่านั้น
- ห้ามใช้ `→` (ลูกศร)
- ห้ามใช้คำว่า จะ / กำลังจะ / ผลลัพธ์จะ
- ห้ามใส่ Footer ระหว่างงาน
- ห้ามรวมหลายข้อในบรรทัดเดียว

**ตัวอย่างที่ถูก:**
```
ทำงาน: ข้อ 1 เริ่ม — pull qwen2.5:3b
ทำงาน: ข้อ 1 เสร็จ — qwen2.5:3b downloaded
ทำงาน: ข้อ 2 เริ่ม — test form auditor
ทำงาน: ข้อ 2 เสร็จ — auditor returned FAIL correctly
```

**ตัวอย่างที่ผิด:**
```
ทำงาน: pull model → test → push
ทำงาน: กำลังจะ pull model
ทำงาน: ข้อ 1 เสร็จ
```

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

## Realtime Work Progress Format

เวลาทำงานหลายข้อ ต้องรายงานความคืบหน้าแบบเรียลไทม์ ห้ามเงียบแล้วสรุปทีเดียว

**รูปแบบ:**
```
ทำงาน: ข้อ 1 เริ่ม — <กำลังทำอะไร>
ทำงาน: ข้อ 1 เสร็จ — <ผลที่ทำเสร็จจริง>
ทำงาน: ข้อ 2 เริ่ม — <กำลังทำอะไร>
ทำงาน: ข้อ 2 เสร็จ — <ผลที่ทำเสร็จจริง>
ทำงาน: blocked — <เหตุผลที่ทำต่อไม่ได้>
```

**กฎ:**
- 1 บรรทัด = 1 สถานะ
- "เริ่ม" ใช้ตอนเริ่มทำข้อนั้นจริง
- "เสร็จ" ใช้เมื่อมีผลจริงแล้วเท่านั้น
- ห้ามใช้ลูกศร →
- ห้ามใช้คำว่า จะ / กำลังจะ / ผลลัพธ์จะ
- ห้ามใส่ Footer ระหว่างงาน
- Footer ใช้เฉพาะตอน [สรุป]
- ห้ามรวมหลายข้อในบรรทัดเดียว

**ถูกต้อง:**
```
ทำงาน: ข้อ 1 เริ่ม — pull qwen2.5:3b
ทำงาน: ข้อ 1 เสร็จ — qwen2.5:3b downloaded
ทำงาน: ข้อ 2 เริ่ม — test form auditor
ทำงาน: ข้อ 2 เสร็จ — auditor returned FAIL correctly
```

**ผิด:**
```
ทำงาน: pull model → test → push
ทำงาน: กำลังจะ pull model
ทำงาน: ข้อ 1 เสร็จ
[Tokens: ...]
```

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

**ต้องตรวจ format Realtime Work Progress ด้วย** — ถ้า draft มีหลายข้อ ต้องมี status line แยกข้อกันชัดเจน และห้ามรวมหลายข้อในบรรทัดเดียว

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
- multi-step status in one line (e.g., "ทำงาน: ข้อ 1 เริ่ม — X → ข้อ 2 เริ่ม — Y")

Allowed work-status line (1 line = 1 status):
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