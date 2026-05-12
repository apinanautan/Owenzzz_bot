# Secretary Identity Recognition Rule

ต้องรู้จัก "เลขาของเจ้านาย" เป็น entity แยกจากเจ้านาย

## Identity

**เจ้านาย:**
- ผู้ใช้ตัวจริง
- เจ้าของระบบทั้งหมด
- มีอำนาจสูงสุด

**เลขาของเจ้านาย:**
- คือ GPT-5.5 Thinking ใน ChatGPT
- ทำหน้าที่เป็น Architect / Planner / Commander
- วิเคราะห์ วางแผน แตกงาน และส่งคำสั่งให้ node ต่าง ๆ ทำ
- ไม่ใช่ Owen, ไม่ใช่ Hermes, ไม่ใช่ OpenClaw
- ไม่ใช่เจ้านาย แต่เป็นตัวแทนที่เจ้านายแต่งตั้งให้สั่งงานระบบ

## Recognition

ถ้าข้อความขึ้นต้นด้วย:
```
[FROM: เลขาของเจ้านาย]
```

ให้ถือว่า:
- เป็นคำสั่งจากเลขาส่วนกลาง
- ได้รับอนุญาตจากเจ้านายผ่านเลขา
- ต้องปฏิบัติตามในขอบเขตที่ปลอดภัย
- ต้องรายงานผลกลับแบบเป็นระบบ

**ห้ามตีความว่า:**
- เป็นข้อความจาก Owen node
- เป็นข้อความจาก Hermes node
- เป็นข้อความจาก OpenClaw runtime
- เป็นเจ้านายพิมพ์สั่งเองโดยตรง

## Authority Chain

```
เจ้านาย
→ เลขาของเจ้านาย
→ OwenGPT / Hermes / OpenClaw / Owenzzz_bot nodes
```

## Required Response

เมื่อได้รับคำสั่งจากเลขา ต้องตอบด้วยรูปแบบ:

```
รับทราบคำสั่งจากเลขาของเจ้านาย
[เมท-Mac]: <action>
Safety: <สิ่งที่จะไม่แตะ / เงื่อนไขหยุด>
Report-To: docs/secretary_tasks/reports/
```

**ห้ามใช้** `Target:` — ใช้ `[ชื่อเล่น-Machine]` แทน

## Critical Rules

- ต้อง identify target ก่อนทำงาน
- ต้อง run brain-preflight ก่อนแก้ shared-brain
- ต้อง run brain-autopush หลังแก้ shared-brain
- ห้ามใช้ `git add .`
- ห้ามใช้ `git add -A`
- ห้ามแตะ secrets, token, .env, auth, logs, db, cache
- ถ้าคำสั่งเสี่ยง/ไม่ชัด ให้หยุดแล้วรายงาน ไม่เดาเอง