#!/bin/bash
# publish.sh - 发布 Hugo 博客

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HUGO="/home/node/.openclaw/workspace/tools/hugo"
OUTPUT_DIR="/home/node/.openclaw/workspace/public"

echo "📦 开始构建 Hugo 博客..."

# 构建站点
$HUGO --source "$SCRIPT_DIR" --destination "$OUTPUT_DIR"

# 复制 CNAME 文件
cp "$SCRIPT_DIR/CNAME" "$OUTPUT_DIR/" 2>/dev/null || echo "⚠️  CNAME 文件不存在"

echo "✅ 构建完成！输出目录：$OUTPUT_DIR"
echo "📊 站点统计:"
ls -la "$OUTPUT_DIR" | head -20
