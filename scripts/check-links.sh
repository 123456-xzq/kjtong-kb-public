#!/usr/bin/env bash
# 校验 Markdown 内相对路径链接是否存在（跳过 http/https/锚点）
set -euo pipefail
fail=0
while IFS= read -r md; do
  dir=$(dirname "$md")
  while IFS= read -r link; do
    [ -z "$link" ] && continue
    case "$link" in http://*|https://*|'#'*|mailto:*) continue;; esac
    target="$dir/${link%%#*}"
    if [ ! -e "$target" ]; then
      echo "✗ $md 断链: $link"; fail=1
    fi
  done < <(grep -oE '\]\([^)]+\)' "$md" | sed -E 's/^\]\((.*)\)$/\1/' 2>/dev/null || true)
done < <(find . -name '*.md' -not -path './.git/*')
[ "$fail" -eq 0 ] || { echo "链接校验失败"; exit 1; }
echo "链接校验通过"
