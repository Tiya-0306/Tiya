# W12｜UI UX Pro Max：AI 設計智慧技能

> 🎯 讓你的 AI agent 自動產出專業級 UI/UX 設計，不用學 Figma

GitHub：https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
⭐ 77K stars | 支援 Kiro、Claude Code、Cursor、Gemini CLI 等 16 種 AI 工具

---

## 這是什麼

UI UX Pro Max 是一個 **AI Skill**（技能包）。安裝到你的 AI agent 後，它會自動：

1. 分析你的需求（「做一個新聞網站」）
2. 從 161 種產業規則中找到最適合的設計方案
3. 推薦風格、色彩、字體、版型
4. 產出完整的程式碼（HTML + Tailwind / React / Astro…）

**跟 Open Design 的差別：**
- Open Design = 獨立的設計工具（有自己的介面）
- UI UX Pro Max = 裝在你現有 AI agent 裡的技能（讓 Kiro/Claude 變聰明）

---

## 安裝（一行指令）

```bash
# 安裝 CLI
npm install -g uipro-cli

# 裝到 Kiro
uipro init --ai kiro

# 或裝到其他 AI 工具
uipro init --ai claude      # Claude Code
uipro init --ai cursor      # Cursor
uipro init --ai gemini      # Gemini CLI
uipro init --ai codex       # Codex CLI
uipro init --ai all         # 全部都裝
```

裝完後，你跟 AI 說「做一個網頁」，它就會自動啟用這個技能。

---

## 核心概念

### 1. 設計系統自動生成

你只要說「做一個美容 spa 的網站」，它會自動產出：

| 項目 | 自動決定的內容 |
|------|--------------|
| **Pattern** | Hero-Centric + Social Proof（適合服務業） |
| **Style** | Soft UI Evolution（柔和陰影、有機形狀） |
| **Colors** | 柔粉 #E8B4B8 + 鼠尾草綠 #A8D5BA + 金色 CTA |
| **Typography** | Cormorant Garamond / Montserrat |
| **Effects** | 柔和陰影 + 200-300ms 過渡動畫 |
| **Anti-patterns** | ❌ 霓虹色、❌ 暗色模式、❌ AI 紫粉漸層 |

### 2. 67 種 UI 風格

| # | 風格 | 適合什麼 |
|---|------|---------|
| 1 | Minimalism 極簡 | 企業應用、文件站 |
| 3 | Glassmorphism 玻璃擬態 | 現代 SaaS、金融 |
| 4 | Brutalism 粗獷主義 | 設計作品集、藝術 |
| 7 | Dark Mode OLED | 夜間 App、程式平台 |
| 12 | Flat Design 扁平 | Web App、MVP |
| 20 | Neubrutalism 新粗獷 | Gen Z 品牌、新創 |
| 21 | Bento Box Grid 便當格 | 儀表板、產品頁 |
| 25 | AI-Native UI | AI 產品、聊天機器人 |
| 37 | E-Ink / Paper 電子紙 | 閱讀 App、數位報紙 |
| 47 | Editorial Grid 編輯格 | **新聞網站**、部落格、雜誌 |

### 3. 161 種產業規則

每種產業都有專屬的設計建議：

| 產業 | 推薦風格 | 推薦色彩 | 禁止事項 |
|------|---------|---------|---------|
| 新聞媒體 | Editorial Grid | 黑白+強調色 | 花俏動畫 |
| SaaS | Glassmorphism | 冷色系 | 過多裝飾 |
| 美容 | Soft UI | 柔粉+金 | 霓虹色 |
| 金融 | Minimalism | 深藍+白 | AI 紫粉漸層 |
| 教育 | Claymorphism | 明亮友善 | 過度複雜 |
| 電商 | Bento Grid | 品牌色為主 | 資訊過載 |

### 4. 57 種字體配對

每種配對都有 Google Fonts 連結，直接可用：

| 配對 | 氛圍 | 適合 |
|------|------|------|
| Playfair Display / Source Sans | 優雅編輯風 | 新聞、雜誌 |
| Inter / Inter | 中性現代 | SaaS、工具 |
| Cormorant / Montserrat | 精緻奢華 | 美容、時尚 |
| Space Grotesk / DM Sans | 科技感 | 開發者工具 |
| Noto Sans TC / Noto Serif TC | 繁中專用 | 中文內容 |

---

## 使用方式

### 自動模式（推薦）

安裝後，直接跟 AI 說你要什麼：

```
做一個新聞網站的首頁，用 Astro + Tailwind
```

AI 會自動：
1. 辨識「新聞網站」→ 套用 Editorial Grid 風格
2. 選擇適合的色彩和字體
3. 產出完整的 HTML/Astro 程式碼
4. 跑 Pre-delivery Checklist 確認品質

### 手動查詢設計系統

```bash
# 查詢適合新聞網站的設計
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "news media editorial" --design-system -p "世新快訊"

# 查詢特定風格
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "editorial grid" --domain style

# 查詢字體配對
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "elegant serif chinese" --domain typography
```

### Kiro 專用（Workflow 模式）

```
/ui-ux-pro-max 做一個新聞網站首頁，風格要像 NYT Magazine
```

---

## 範例 Prompt

### 範例 1：新聞網站（配合 W12 的 Astro）

```
用 Astro + Tailwind 做一個新聞網站首頁。

名稱：世新快訊
風格：Editorial Grid（編輯格）
內容：
- 頂部導覽列
- 頭條新聞（大圖+標題）
- 3 篇最新文章列表
- 側邊欄（分類標籤）

要求：
- 繁體中文
- 響應式（手機/桌面）
- 用 Noto Sans TC 字體
```

### 範例 2：社群圖卡

```
做一張 1080×1080 的 IG 圖卡。

主題：「5 個 ASR 常見錯誤」
風格：Neubrutalism（新粗獷）
色彩：黑底+螢光綠強調
內容：標題 + 5 個 bullet points
```

### 範例 3：課程簡報

```
做一份 5 頁的 HTML 簡報。

主題：網路新聞工具總覽
風格：Bento Box Grid
每頁一個工具：Markdown → IDE → CLI → MCP → ASR
用 dark mode
```

---

## Pre-delivery Checklist（品質檢查）

AI 產出前會自動檢查：

- [ ] 不用 emoji 當圖示（用 SVG：Heroicons/Lucide）
- [ ] 所有可點擊元素有 `cursor-pointer`
- [ ] Hover 狀態有 150-300ms 過渡動畫
- [ ] 文字對比度 ≥ 4.5:1（WCAG AA）
- [ ] 鍵盤導航有 focus 狀態
- [ ] 尊重 `prefers-reduced-motion`
- [ ] 響應式：375px / 768px / 1024px / 1440px

---

## 跟 W12 的整合

| 你要做的 | 用什麼 |
|---------|--------|
| 新聞網站（Astro） | UI UX Pro Max 產出 Astro 元件 |
| 社群圖卡（IG） | UI UX Pro Max 產出 HTML → 截圖 |
| 網站風格客製化 | 查詢 Design System → 套用到 Astro |
| 一稿多發的視覺版 | 搭配 Open Design 的 social-carousel |

**建議流程：**
```
1. uipro init --ai kiro          ← 安裝技能
2. 跟 Kiro 說「做新聞網站」       ← 自動產出設計系統
3. 把產出的 HTML 放進 Astro       ← 整合到你的網站
4. git push → GitHub Pages 上線  ← 部署
```

---

## 支援的技術棧

| 類別 | 框架 |
|------|------|
| Web | HTML + Tailwind（預設）、**Astro** |
| React | React、Next.js、shadcn/ui |
| Vue | Vue、Nuxt.js |
| 其他 | Svelte、Angular、Laravel |
| Mobile | SwiftUI、React Native、Flutter |

在 prompt 裡提到你用什麼框架，它就會產出對應的程式碼。

---

## 比較：Open Design vs UI UX Pro Max

| | Open Design | UI UX Pro Max |
|---|---|---|
| 類型 | 獨立工具（有 UI） | AI Skill（裝在 agent 裡） |
| 安裝 | Docker / pnpm | `npm install -g uipro-cli` |
| 使用方式 | 開瀏覽器操作 | 直接跟 AI 對話 |
| 設計系統 | 129 種品牌 | 161 種產業規則 |
| 風格 | 5 種視覺方向 | 67 種 UI 風格 |
| 產出 | HTML artifact（預覽+下載） | 直接寫入你的專案檔案 |
| 適合 | 從零開始設計 | 已有專案，要加 UI |

**結論：兩個可以一起用。** Open Design 做概念設計，UI UX Pro Max 做實際程式碼。
