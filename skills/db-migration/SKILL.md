---
name: db-migration
description: 当需要新增/修改数据库表结构、编写 Alembic 迁移脚本时触发
---
# 数据库迁移 Skill

## 步骤
1. 修改 `models/` 中的 ORM 模型
2. `alembic revision --autogenerate -m "描述"`
3. **必检**：生成脚本中的 `downgrade()` 必须可回滚
4. 本地 `alembic upgrade head` → `pytest` 验证

## 反例
- 不要手写 SQL 绕过 Alembic
- 不要在迁移里做数据+结构混合变更（拆成两次）
