# Mandatory Git Sync

กฎบังคับก่อนทำงานทุกครั้ง:
1. ต้องรัน `./scripts/brain-preflight.sh`
2. ถ้า local ตามหลัง origin/main ให้ pull อัตโนมัติ
3. ถ้ามี conflict ให้หยุดทันทีและรายงานเจ้านาย
4. ห้ามเริ่มแก้ไฟล์ถ้า repo ยังไม่ sync

กฎบังคับหลังทำงานทุกครั้งที่แก้ shared-brain:
1. ต้องรัน `./scripts/brain-autopush.sh`
2. add เฉพาะ whitelist เท่านั้น
3. ห้ามใช้ git add . หรือ git add -A
4. ถ้ามี change จริง ให้ commit + push อัตโนมัติ
5. ถ้าไม่มี change ให้รายงานว่า clean

Whitelist:
- AGENTS.md
- SOUL.md
- memories/
- skills/
- scripts/
- docs/
- configs/devices/
