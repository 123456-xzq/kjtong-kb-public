#!/usr/bin/env bash
# 场景3敏感信息粗筛：拦截客户原文、个人信息、硬编码凭据
set -euo pipefail
fail=0
PATTERN='ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|GITHUB_PAT[[:space:]]*=[[:space:]]*[^$]|[1-9][0-9]{10,}|[0-9]{17}[0-9Xx]'
HIT=$(grep -rInE "$PATTERN" \
  --include='*.md' --include='*.yml' --include='*.yaml' --include='*.sh' \
  AGENTS.md CLAUDE.md docs skills .github scripts 2>/dev/null || true)
if [ -n "$HIT" ]; then
  echo "✗ 疑似敏感信息（客户原文/手机号/身份证/PAT），请人工复核：" >&2
  echo "$HIT" >&2
  fail=1
fi
[ "$fail" -eq 0 ] || exit 1
echo "敏感信息粗筛通过"
