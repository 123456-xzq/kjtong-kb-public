# AGENTS.md — 报关易 / 跨通关 KJTONG 共享知识库（L1 公开）

## 本仓库职责
- **事实源**：报关法规原文（只增不改）、编码约定、SKILL、脱敏索引卡目录。
- **门禁**：公开仓库享有分支保护 + CODEOWNERS 必审；所有写入走 PR，禁止直推 main。

## 数据分级（写入前必判，最高优先级）
- L1 公开：法规原文、HS 通则、编码约定、SKILL → 可入本仓库。
- L2 脱敏：运营 SOP、客户索引卡（哈希 ID、无原文无个人信息）→ 入私有仓库 `kjtong-kb-private`。
- L3 受限：客户报关原文、联系人/地址/电话/金额明细 → **禁止入任何 GitHub 仓库**，仅留本机 `D:\kjtong-local\raw\`。

## 常用命令
- 校验：`bash scripts/check-skills.sh` · `bash scripts/check-links.sh` · `bash scripts/check-sensitive.sh`
- 提交：`git checkout -b kb/<主题>` → commit → PR（必审通过后合入）

## Do（必须）
- 法规更新只新增带日期文件 `docs/regulations/YYYY-MM-DD-<主题>.md`，附来源 URL / 发布日期 / 生效日期。
- 每条写入记忆带 `owner_agent_id`；讨论≠记忆，结论必须显式落盘。
- 回答引用知识时附文件路径 + 出处，便于溯源。

## Don't（禁止）
- 禁止修改或删除既有法规原文文件（发现错误走新增更正条款）。
- 禁止把客户原文、个人信息、密钥写入仓库（CI 会粗筛拦截）。
- 禁止直推 main；禁止在 SKILL.md 之外硬编码情景化步骤。

## 常见任务动作表
| 任务 | 先读 | 再改 | 验证 |
|---|---|---|---|
| 更新法规 | docs/regulations/ 最新日期 | 新增带日期文件 | check-links + PR |
| 改编码约定 | 本文件 | 本文件（≤40行） | wc -l ≤ 40 |
| 加 Skill | skills/ | 新建 SKILL.md | check-skills |
