#!/usr/bin/env bash
# Test runner for onedark.nvim
# Usage: ./tests/run-tests.sh [--automated|--manual]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "════════════════════════════════════════════════════════════"
echo "  onedark.nvim Test Suite"
echo "════════════════════════════════════════════════════════════"
echo ""

run_automated_tests() {
  echo "Running automated tests..."
  echo ""

  if nvim --version >/dev/null 2>&1; then
    NVIM_VERSION=$(nvim --version | head -n1)
    echo "✓ Neovim found: $NVIM_VERSION"
  else
    echo -e "${RED}✗ Neovim not found. Please install Neovim 0.9+${NC}"
    exit 1
  fi

  echo ""
  echo "Running highlight tests..."
  if nvim --headless -u tests/test-init.lua -c "luafile tests/automated/test_highlights.lua" 2>&1; then
    echo -e "${GREEN}✓ All automated tests passed!${NC}"
    return 0
  else
    echo -e "${RED}✗ Some tests failed${NC}"
    return 1
  fi
}

run_manual_tests() {
  echo "Opening manual test files..."
  echo ""
  echo "Manual testing checklist:"
  echo "  1. TreeSitter syntax highlighting"
  echo "  2. Markdown formatting (@markup.italic, @markup.strikethrough)"
  echo "  3. Diagnostic highlights (Error, Warn, Info, Hint, Unnecessary, Deprecated)"
  echo "  4. Git conflict markers (green/blue/purple backgrounds)"
  echo "  5. MatchParen visibility in comments"
  echo "  6. EndOfBuffer tildes visibility"
  echo ""
  echo "Test commands available:"
  echo "  :TestHighlights   - Show all highlight groups"
  echo "  :TestColors       - Show color palette"
  echo "  :TestDiagnostics  - Add test diagnostics"
  echo "  :Inspect          - Show highlight under cursor"
  echo ""
  echo "Press Enter to continue..."
  read

  # Open test files in splits
  nvim -u tests/test-init.lua \
    tests/manual/test.md \
    -c "split tests/manual/test.lua" \
    -c "split tests/manual/test-conflict.txt"
}

show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --automated, -a    Run automated tests only"
  echo "  --manual, -m       Open manual test files"
  echo "  --help, -h         Show this help message"
  echo ""
  echo "If no option is provided, runs automated tests first,"
  echo "then asks if you want to run manual tests."
}

# Parse arguments
case "${1:-}" in
  --automated|-a)
    run_automated_tests
    exit $?
    ;;
  --manual|-m)
    run_manual_tests
    exit 0
    ;;
  --help|-h)
    show_help
    exit 0
    ;;
  "")
    # Run both
    if run_automated_tests; then
      echo ""
      echo "────────────────────────────────────────────────────────────"
      echo ""
      read -p "Run manual tests? (y/N): " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        run_manual_tests
      fi
    else
      echo ""
      echo -e "${YELLOW}Fix automated tests before running manual tests${NC}"
      exit 1
    fi
    ;;
  *)
    echo "Unknown option: $1"
    echo ""
    show_help
    exit 1
    ;;
esac
