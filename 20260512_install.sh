#!/bin/bash
# ============================================================
# 🚀 W12 全課程工具一鍵安裝（學校電腦版 — 無需管理員權限）
# 版本：2026-05-12
# ============================================================
#
# ⚠️ 所有東西裝在你指定的資料夾裡，不動系統目錄。
# 拔隨身碟就帶走，不留痕跡。
#
# 用法：
#   curl -fsSL https://172329.xyz/20260512/install.sh | bash
# ============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}✓${NC} $1"; }
warn()  { echo -e "${YELLOW}⚠${NC} $1"; }
step()  { echo -e "\n${BLUE}──${NC} $1 ${BLUE}──${NC}"; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  🚀 W12 全課程工具安裝（學校電腦版）                   ║"
echo "║  所有東西裝在你的工作區，不需要管理員權限               ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# ── 詢問安裝路徑 ──
echo -e "${BLUE}請輸入你想要安裝的路徑${NC}"
echo "（例如：~/Desktop/my-tools 或 /Volumes/USB/tools）"
echo -n "路徑 [預設: ~/Desktop/shuj-tools]: "
read -r INSTALL_DIR
INSTALL_DIR="${INSTALL_DIR:-$HOME/Desktop/shuj-tools}"
INSTALL_DIR="${INSTALL_DIR/#\~/$HOME}"

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

echo ""
info "安裝路徑：$INSTALL_DIR"
echo ""

# ── 設定本地 PATH ──
LOCAL_BIN="$INSTALL_DIR/bin"
mkdir -p "$LOCAL_BIN"
export PATH="$LOCAL_BIN:$INSTALL_DIR/node/bin:$PATH"

# 寫一個啟動腳本，之後每次用只要 source 這個
cat > "$INSTALL_DIR/activate.sh" << 'ACTIVATE'
#!/bin/bash
# source 這個檔案來啟用工具
TOOLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$TOOLS_DIR/bin:$TOOLS_DIR/node/bin:$TOOLS_DIR/node_modules/.bin:$PATH"
export NODE_PATH="$TOOLS_DIR/node_modules"
echo "✓ 工具已啟用（路徑：$TOOLS_DIR）"
ACTIVATE
chmod +x "$INSTALL_DIR/activate.sh"

# ══════════════════════════════════════════════════════════════
# 1. Node.js（本地安裝，不動系統）
# ══════════════════════════════════════════════════════════════
step "1/7 Node.js（本地安裝）"

if [ ! -d "$INSTALL_DIR/node" ]; then
    ARCH=$(uname -m)
    if [ "$ARCH" = "arm64" ]; then
        NODE_URL="https://nodejs.org/dist/v22.15.0/node-v22.15.0-darwin-arm64.tar.xz"
    else
        NODE_URL="https://nodejs.org/dist/v22.15.0/node-v22.15.0-darwin-x64.tar.xz"
    fi
    curl -fsSL "$NODE_URL" | tar -xJ --strip-components=1 -C "$INSTALL_DIR" 2>/dev/null
    mv "$INSTALL_DIR/bin" "$INSTALL_DIR/node-bin-tmp" 2>/dev/null || true
    mkdir -p "$INSTALL_DIR/node/bin" "$INSTALL_DIR/node/lib"
    mv "$INSTALL_DIR/node-bin-tmp/"* "$INSTALL_DIR/node/bin/" 2>/dev/null || true
    mv "$INSTALL_DIR/lib/"* "$INSTALL_DIR/node/lib/" 2>/dev/null || true
    rmdir "$INSTALL_DIR/node-bin-tmp" 2>/dev/null || true
    # Simpler: just extract properly
    rm -rf "$INSTALL_DIR/node"
    mkdir -p "$INSTALL_DIR/node"
    curl -fsSL "$NODE_URL" | tar -xJ --strip-components=1 -C "$INSTALL_DIR/node"
fi
export PATH="$INSTALL_DIR/node/bin:$PATH"
info "Node.js OK ($(node --version))"

# npm 全域改到本地
export NPM_CONFIG_PREFIX="$INSTALL_DIR"
npm config set prefix "$INSTALL_DIR" 2>/dev/null || true

# ══════════════════════════════════════════════════════════════
# 2. AI CLI agents（裝在工作區）
# ══════════════════════════════════════════════════════════════
step "2/7 AI CLI agents"

if ! command -v kiro-cli &>/dev/null; then
    curl -fsSL https://cli.kiro.dev/install | KIRO_INSTALL_DIR="$INSTALL_DIR/bin" bash 2>/dev/null || true
fi
command -v kiro-cli &>/dev/null && info "kiro-cli OK" || warn "kiro-cli 跳過"

npm install --prefix "$INSTALL_DIR" @openai/codex 2>/dev/null || true
[ -f "$INSTALL_DIR/node_modules/.bin/codex" ] && info "codex OK" || warn "codex 跳過"

npm install --prefix "$INSTALL_DIR" @google/gemini-cli 2>/dev/null || true
[ -f "$INSTALL_DIR/node_modules/.bin/gemini" ] && info "gemini OK" || warn "gemini 跳過"

# ══════════════════════════════════════════════════════════════
# 3. Skills（AI 技能包）
# ══════════════════════════════════════════════════════════════
step "3/7 Skills"

npm install --prefix "$INSTALL_DIR" uipro-cli 2>/dev/null || true
if [ -f "$INSTALL_DIR/node_modules/.bin/uipro" ]; then
    "$INSTALL_DIR/node_modules/.bin/uipro" init --ai kiro 2>/dev/null || true
    info "ui-ux-pro-max OK"
else
    warn "uipro-cli 跳過"
fi

# ══════════════════════════════════════════════════════════════
# 4. 媒體工具
# ══════════════════════════════════════════════════════════════
step "4/7 媒體工具（yt-dlp + ffmpeg）"

if [ ! -f "$LOCAL_BIN/yt-dlp" ]; then
    curl -fsSL "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_macos" -o "$LOCAL_BIN/yt-dlp" 2>/dev/null
    chmod +x "$LOCAL_BIN/yt-dlp"
fi
[ -f "$LOCAL_BIN/yt-dlp" ] && info "yt-dlp OK" || warn "yt-dlp 跳過"

if ! command -v ffmpeg &>/dev/null; then
    warn "ffmpeg 未安裝（需要管理員權限，跳過）"
else
    info "ffmpeg OK（系統已有）"
fi

# ══════════════════════════════════════════════════════════════
# 5. GitHub CLI
# ══════════════════════════════════════════════════════════════
step "5/7 GitHub CLI"

if [ ! -f "$LOCAL_BIN/gh" ]; then
    GH_URL="https://github.com/cli/cli/releases/latest/download/gh_2.74.0_macOS_arm64.zip"
    curl -fsSL "$GH_URL" -o /tmp/gh.zip 2>/dev/null
    unzip -qo /tmp/gh.zip -d /tmp/gh-tmp 2>/dev/null
    cp /tmp/gh-tmp/*/bin/gh "$LOCAL_BIN/gh" 2>/dev/null || true
    chmod +x "$LOCAL_BIN/gh" 2>/dev/null
    rm -rf /tmp/gh.zip /tmp/gh-tmp
fi
[ -f "$LOCAL_BIN/gh" ] && info "GitHub CLI OK" || warn "gh 跳過"

# ══════════════════════════════════════════════════════════════
# 6. MCP 工具
# ══════════════════════════════════════════════════════════════
step "6/7 MCP 工具"

if [ ! -d "$INSTALL_DIR/savorithm" ]; then
    git clone https://github.com/FakeRocket543/savorithm.git "$INSTALL_DIR/savorithm" 2>/dev/null || true
fi
[ -d "$INSTALL_DIR/savorithm" ] && info "savorithm OK" || warn "savorithm 跳過"

if [ ! -d "$INSTALL_DIR/collatro" ]; then
    git clone https://github.com/FakeRocket543/collatro.git "$INSTALL_DIR/collatro" 2>/dev/null || true
fi
[ -d "$INSTALL_DIR/collatro" ] && info "collatro OK" || warn "collatro 跳過"

# ══════════════════════════════════════════════════════════════
# 7. mark2 + Open Design
# ══════════════════════════════════════════════════════════════
step "7/7 設計工具"

if [ ! -d "$INSTALL_DIR/mark2" ]; then
    git clone https://github.com/ywleeo/mark2.git "$INSTALL_DIR/mark2" 2>/dev/null || true
fi
[ -d "$INSTALL_DIR/mark2" ] && info "mark2 OK（Markdown Reader）" || warn "mark2 跳過"

if [ ! -d "$INSTALL_DIR/open-design" ]; then
    git clone https://github.com/nexu-io/open-design.git "$INSTALL_DIR/open-design" 2>/dev/null || true
fi
[ -d "$INSTALL_DIR/open-design" ] && info "Open Design OK" || warn "Open Design 跳過"
if [ ! -d "$OD_DIR" ]; then
    git clone https://github.com/nexu-io/open-design.git "$OD_DIR" 2>/dev/null || true
fi
if [ -d "$OD_DIR" ]; then
    info "Open Design OK（$OD_DIR）"
    info "  啟動：cd ~/open-design && pnpm install && pnpm tools-dev run web"
    info "  或用 Docker：cd ~/open-design/deploy && docker compose up -d"
else
    warn "Open Design 跳過 — 可手動下載桌面版：https://open-design.ai"
fi

# ══════════════════════════════════════════════════════════════
# 完成
# ══════════════════════════════════════════════════════════════
echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  ✅ 安裝完成！                                        ║"
echo "╠══════════════════════════════════════════════════════╣"
echo "║                                                      ║"
echo "║  📂 所有工具在：$INSTALL_DIR"
echo "║                                                      ║"
echo "║  🔑 每次使用前，先執行：                               ║"
echo "║  source $INSTALL_DIR/activate.sh"
echo "║                                                      ║"
echo "║  🚀 W12 快速開始：                                    ║"
echo "║  source activate.sh                                   ║"
echo "║  npx create-astro@latest my-news-site                 ║"
echo "║  cd my-news-site && npm run dev                       ║"
echo "║                                                      ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""
echo "📦 老師的 Repos："
echo "  • rescrit-lite：https://github.com/FakeRocket543/rescrit-lite"
echo "  • savorithm：https://github.com/FakeRocket543/savorithm"
echo "  • collatro：https://github.com/FakeRocket543/collatro"
echo "  • TFC 視覺化：https://fakerocket543.github.io/tfc-viz/"
echo ""
