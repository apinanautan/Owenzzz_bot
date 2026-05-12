# Mandatory Git Sync

เป็นกฎเหล็กขั้นสูงสุด ทุกงานที่แก้ไฟล์ shared-brain ต้องปฏิบัติตามทุกข้อ

## ก่อนทำงาน (Preflight)

รัน `./scripts/brain-preflight.sh` ทุกครั้ง:
1. Auto pull อัตโนมัติ ถ้า local ตามหลัง origin/main
2. **ถ้า local นำหน้า origin/main** → หยุดทันที รายงานเจ้านายก่อน (เพราะอาจมี conflict)
3. **ถ้า push ล้มเหลว** → รายงานเจ้านายทันที ห้ามปิดบัง
4. ห้ามเริ่มแก้ไฟล์ถ้า repo ยังไม่ sync

## หลังแก้ไข (Autopush)

รัน `./scripts/brain-autopush.sh` ทุกครั้งที่แก้ shared-brain:
1. ใช้ whitelist อย่างเดียว
2. ห้ามใช้ `git add .` หรือ `git add -A`
3. Auto commit + push ถ้ามี change
4. ถ้าไม่มี change → รายงาน owner ว่า clean

## Whitelist (ห้ามแก้ไข)

- AGENTS.md
- SOUL.md
- memories/
- skills/
- scripts/
- docs/
- configs/devices/

## Hard Rules

- ห้าม commit ขยะ (ไฟล์ชั่วคราว, cache, node_modules, .env ฯลฯ)
- ห้าม force push
- ห้ามปิดบัง push error
- ทุกครั้งที่ push เสร็จ → แจ้งเจ้านายทันที

## การแจ้งเจ้านาย (บังคับ)

หลัง push เสร็จทุกครั้ง ต้องรายงาน:
- commit message
- files ที่เปลี่ยน
- result (สำเร็จ/ล้มเหลว)
