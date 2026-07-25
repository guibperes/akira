#!/bin/bash
# Akira アキラ — theme generator
# scripts/theme.sh
#
# Renders every *.tmpl under configs/ using the canonical palette.
# Call it from config.sh, or run directly: bash scripts/theme.sh

set -euo pipefail

AKIRA_DIR_PATH="$HOME/.akira"
source "$AKIRA_DIR_PATH/theme/akira.env"

echo -e "# Generating themes from configs/theme/akira.env"

count=0
while IFS= read -r -d '' tmpl; do
  out="${tmpl%.tmpl}"
  envsubst "$AKIRA_VARS" <"$tmpl" >"$out"
  echo "  -> ${out#"$AKIRA_DIR_PATH/"}"
  count=$((count + 1))
done < <(find "$AKIRA_DIR_PATH/configs" -type f -name '*.tmpl' -print0)

echo -e "# $count file(s) generated"

# Lint: templates must not contain literal hex values.
stray=$(grep -rIn -E '#[0-9A-Fa-f]{6}\b' \
  --include='*.tmpl' "$AKIRA_DIR_PATH/configs" || true)
if [ -n "$stray" ]; then
  echo -e "# Warning: literal hex inside a template (should be a variable):"
  echo "$stray"
fi

# Lint: generated files must not contain unresolved variables.
unresolved=$(grep -rIn '\$AKIRA_' "$AKIRA_DIR_PATH/configs" \
  --exclude='*.tmpl' --exclude='akira.env' || true)
if [ -n "$unresolved" ]; then
  echo -e "# Warning: unresolved variable in generated output (typo?):"
  echo "$unresolved"
fi
