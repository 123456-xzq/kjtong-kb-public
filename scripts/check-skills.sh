#!/usr/bin/env bash
# 校验所有 SKILL.md 具备合法 YAML frontmatter（name / description）
set -euo pipefail
fail=0
while IFS= read -r f; do
  head=$(head -n 1 "$f")
  if [ "$head" != "---" ]; then
    echo "✗ $f 缺少 frontmatter 起始 ---"; fail=1; continue
  fi
  for key in name description; do
    if ! sed -n '1,10p' "$f" | grep -q "^${key}:"; then
      echo "✗ $f frontmatter 缺少 ${key}"; fail=1
    fi
  done
  echo "✓ $f"
done < <(find . -name SKILL.md -not -path './.git/*')
[ "$fail" -eq 0 ] || { echo "SKILL.md 校验失败"; exit 1; }
echo "SKILL.md 校验通过"
