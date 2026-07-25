#!/bin/bash
# Akira アキラ — theme generator
# scripts/theme.sh
#
# Renders every *.tmpl found under the configured roots, writing
# each result next to its template with the .tmpl suffix removed.
#
# Both default roots live in the repository:
#   configs/          per-app configuration
#   theme/            theme definitions
#
# Overridable when you want to regenerate a single tree:
#   AKIRA_TEMPLATE_ROOTS=".akira/theme" bash scripts/theme.sh

set -euo pipefail

source "$HOME/.akira/scripts/env.sh"

AKIRA_PALETTE="${AKIRA_PALETTE:-$AKIRA_DIR_PATH/theme/akira.env}"
AKIRA_TEMPLATE_ROOTS="${AKIRA_TEMPLATE_ROOTS:-configs:theme}"

if [ ! -f "$AKIRA_PALETTE" ]; then
  echo -e "# Error: palette not found at $AKIRA_PALETTE" >&2
  exit 1
fi

source "$AKIRA_PALETTE"

echo -e "# Generating themes from ${AKIRA_PALETTE#"$AKIRA_DIR_PATH/"}"

count=0
seen=""

while IFS= read -r root; do
  [ -n "$root" ] || continue

  # Roots are repo-relative; absolute paths are honoured as-is
  case "$root" in
  /*) abs="$root" ;;
  *) abs="$AKIRA_DIR_PATH/$root" ;;
  esac

  if [ ! -d "$abs" ]; then
    echo -e "# Warning: root not found, skipping: $root" >&2
    continue
  fi

  abs=$(cd "$abs" && pwd)

  while IFS= read -r -d '' tmpl; do
    # Guard against overlapping roots rendering the same file twice
    case "$seen" in
    *"|$tmpl|"*) continue ;;
    esac
    seen="$seen|$tmpl|"

    out="${tmpl%.tmpl}"
    envsubst "$AKIRA_VARS" <"$tmpl" >"$out"
    echo "  -> ${out#"$AKIRA_DIR_PATH/"}"
    count=$((count + 1))
  done < <(find "$abs" -type f -name '*.tmpl' -print0)

done < <(printf '%s\n' "$AKIRA_TEMPLATE_ROOTS" | tr ':' '\n')

echo -e "# $count file(s) generated"

# ── Lint ─────────────────────────────────────────────────────
lint() {
  local pattern="$1" label="$2"
  shift 2
  local hits="" root abs
  while IFS= read -r root; do
    [ -n "$root" ] || continue
    case "$root" in
    /*) abs="$root" ;;
    *) abs="$AKIRA_DIR_PATH/$root" ;;
    esac
    [ -d "$abs" ] || continue
    hits="$hits$(grep -rIn -E "$pattern" "$@" "$abs" 2>/dev/null || true)"
  done < <(printf '%s\n' "$AKIRA_TEMPLATE_ROOTS" | tr ':' '\n')

  if [ -n "$hits" ]; then
    echo -e "# Warning: $label"
    echo "$hits" | sed "s|$AKIRA_DIR_PATH/||"
  fi
}

# Templates must not contain literal hex values.
lint '#[0-9A-Fa-f]{6}\b' \
  "literal hex inside a template (should be a variable):" \
  --include='*.tmpl'

# Generated output must not contain unresolved variables.
lint '\$AKIRA_[A-Z_]+' \
  "unresolved variable in generated output (typo, or missing from the palette):" \
  --exclude='*.tmpl' --exclude='akira.env'

exit 0
