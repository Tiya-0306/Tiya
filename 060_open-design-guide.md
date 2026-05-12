# W12｜Open Design：用 AI 做設計

> 🎯 目標：用自然語言描述需求，讓 AI 產出品牌級的網頁、圖卡、簡報

GitHub：https://github.com/nexu-io/open-design
官網：https://open-design.ai

---

## 這是什麼

Open Design 是開源的 AI 設計工具（Claude Design 的開源替代品）。你用中文描述你要什麼，它幫你做出來：

- 社群輪播圖（IG/FB）
- 網頁原型（landing page）
- 手機 App 畫面
- 雜誌風簡報
- 海報、Email 行銷信

**重點：它不是隨便生成。** 它有 129 種品牌設計系統（Linear、Apple、Notion、小紅書…），產出的東西有一致的色彩、字體、排版規範。

---

## 核心概念

### 1. Skill（技能）= 你要做什麼類型的東西

31 種內建技能，分成兩大類：

**Prototype 模式（27 種）— 單頁成品：**

| Skill | 產出什麼 | 適合場景 |
|-------|---------|---------|
| `social-carousel` | 3 張 1080×1080 輪播圖 | IG/FB 貼文 |
| `magazine-poster` | 雜誌風海報 | 活動宣傳 |
| `web-prototype` | 網頁原型 | Landing page |
| `saas-landing` | SaaS 行銷頁 | 產品介紹 |
| `mobile-app` | iPhone/Android App 畫面 | App 設計 |
| `mobile-onboarding` | 手機 onboarding 流程 | App 新手引導 |
| `email-marketing` | HTML Email | 產品發布信 |
| `dashboard` | 後台儀表板 | 數據呈現 |
| `blog-post` | 部落格文章版型 | 長文排版 |
| `digital-eguide` | 電子書封面+內頁 | 教學手冊 |
| `wireframe-sketch` | 手繪風線框圖 | 早期構想 |

**Deck 模式（4 種）— 橫向滑動簡報：**

| Skill | 風格 |
|-------|------|
| `guizang-ppt` | 雜誌風 Web PPT（預設）|
| `simple-deck` | 極簡橫向簡報 |
| `replit-deck` | 產品 walkthrough |
| `weekly-update` | 週報簡報 |

---

### 2. Design System（設計系統）= 用誰的風格

129 種品牌風格，每個都是一份完整的 `DESIGN.md`，包含：
- 色彩系統（主色、輔色、中性色）
- 字體堆疊（標題、內文、程式碼）
- 間距規範
- 元件樣式
- 語氣與品牌聲音

**常用的幾個：**

| 分類 | 品牌 |
|------|------|
| AI/開發者 | Claude、Cursor、Vercel、Linear、Supabase |
| 生產力 | Notion、Figma、Raycast |
| 消費品 | Apple、Nike、Airbnb、Spotify |
| 金融 | Stripe、Coinbase、Revolut |
| 汽車 | Tesla、BMW、Ferrari |
| 社群 | 小紅書（Xiaohongshu）、Meta |
| 入門 | `default`（中性現代）、`warm-editorial`（溫暖編輯風）|

**怎麼選？**
- 做新聞圖卡 → `default` 或 `warm-editorial`
- 模仿某品牌風格 → 直接選那個品牌
- 做科技產品介紹 → `linear-app` 或 `vercel`
- 做生活類內容 → `notion` 或 `airbnb`

---

### 3. Visual Direction（視覺方向）= 沒有品牌時的 5 個選擇

當你沒有特定品牌要套用時，AI 會給你 5 個方向選：

| 方向 | 氛圍 | 參考 |
|------|------|------|
| **Editorial Monocle** | 印刷雜誌風：墨色+奶油色+暖鏽色 | Monocle、FT Weekend、NYT Magazine |
| **Modern Minimal** | 冷色極簡：結構化、少量強調色 | Linear、Vercel、Stripe |
| **Tech Utility** | 資訊密度高：等寬字體、終端機感 | Bloomberg、Bauhaus 工具 |
| **Brutalist** | 粗獷：超大字、無陰影、強烈對比 | Bloomberg Businessweek |
| **Soft Warm** | 溫暖：低對比、桃色中性色 | Notion 行銷頁、Apple Health |

選一個 → AI 自動綁定確定的色票+字體，不會亂發揮。

---

### 4. Question Form（問題表單）= AI 先問再做

這是 Open Design 最重要的設計：**AI 不會直接開始做，會先問你一輪問題。**

問什麼：
- 做給誰看？（受眾）
- 什麼語氣？（正式/口語/活潑）
- 什麼品牌？（有的話貼 logo/網址）
- 什麼規模？（一頁/多頁/系列）
- 什麼限制？（顏色/字數/尺寸）

**為什麼這很重要？**
30 秒填表 > 30 分鐘改方向。先鎖定需求，再動手做。

---

### 5. Anti-AI-Slop（防止 AI 垃圾設計）

Open Design 內建了一套「禁止清單」，防止 AI 產出那種一看就知道是 AI 做的東西：

❌ 禁止：
- 紫色漸層背景
- 通用 emoji 圖示
- 圓角卡片+左邊彩色邊框
- 手繪風 SVG 人物
- Inter 字體當標題
- 捏造的數據（「10× faster」）

✅ 要求：
- 沒有真實數據就用 `—` 或灰色佔位
- 色彩必須來自 Design System，不能自己發明
- 排版必須有層次（不是全部一樣大）

---

## 安裝與啟動

### 方法 1：Docker（推薦，最快）

```bash
git clone https://github.com/nexu-io/open-design.git
cd open-design/deploy
docker compose up -d
```

打開 http://localhost:7456

### 方法 2：從原始碼

```bash
git clone https://github.com/nexu-io/open-design.git
cd open-design
corepack enable
pnpm install
pnpm tools-dev run web
```

### 方法 3：下載桌面版（不用裝任何東西）

到 https://open-design.ai 下載 macOS / Windows 版本。

---

## 使用流程

```
1. 選 Skill（做什麼類型）
2. 選 Design System（用什麼風格）
3. 打字描述你要什麼
4. AI 跳出 Question Form → 填完
5. AI 選/你選 Visual Direction
6. AI 產出 → 即時預覽
7. 下載（HTML / PDF / ZIP）
```

---

## 範例 Prompt

### 範例 1：新聞圖卡

```
幫我做一組 3 張 IG 輪播圖。

主題：基隆捷運規劃爭議懶人包
風格：Editorial Monocle
語言：繁體中文

每張一個重點：
1. 時間軸（2006-2026 規劃變遷）
2. 各方立場（交通部 vs 基隆市 vs 民間）
3. 結論與影響

尺寸：1080×1080
```

### 範例 2：課程簡報

```
做一份 5 頁的課程簡報。

主題：ASR 自動語音辨識入門
受眾：大學新聞系學生
風格：Modern Minimal
內容：
- 封面
- ASR 是什麼（一句話解釋）
- 三種引擎比較（Whisper / Breeze / Qwen3）
- 常見錯誤類型
- 課堂實作步驟
```

### 範例 3：新聞網站原型

```
做一個新聞網站的首頁原型。

名稱：「世新快訊」
風格：用 Notion 的 Design System
內容：
- 頂部導覽列（首頁/校園/生活/科技）
- 頭條新聞（大圖+標題）
- 最新文章列表（3 篇，含日期和摘要）
- 側邊欄（熱門標籤）
```

---

## 查詢設計方案的方法

### 在介面中

1. **左側面板** → Design Systems → 瀏覽 129 種
2. **每個系統** → 點進去看完整的色票、字體、範例
3. **Skill 選擇器** → 按場景分類（design / marketing / operation / engineering）

### 在 GitHub 中

- 所有 Design System：`design-systems/` 資料夾
- 所有 Skill：`skills/` 資料夾
- 每個 Skill 都有 `example.html` 可以直接打開看成品

### 用 API

```bash
# 列出所有 skills
curl http://localhost:7456/api/skills

# 列出所有 design systems
curl http://localhost:7456/api/design-systems

# 看某個 skill 的範例
curl http://localhost:7456/api/skills/social-carousel/example
```

---

## 跟 W12 的關係

你這週學了：
- **Astro** → 把新聞稿變成網站（完整版）
- **一稿多發** → 同一篇稿轉成 FB/X/IG 文字版

加上 Open Design：
- **社群圖卡** → 用 `social-carousel` 做 IG 輪播圖
- **網站設計** → 用 `web-prototype` 做你的 Astro 網站的設計稿
- **簡報** → 用 `guizang-ppt` 做期末報告簡報

**一稿四發：**
```
新聞稿（Markdown）
  ├── Astro 網站（完整版）
  ├── IG 輪播圖（Open Design → social-carousel）
  ├── FB 貼文（AI 文字轉換）
  └── X 推文（AI 文字轉換）
```

---

## 重要提醒

| 項目 | 說明 |
|------|------|
| 需要 AI agent | 你的電腦上要有 Kiro CLI / Claude Code / Gemini CLI 等任一個 |
| 免費 | 開源 Apache-2.0，不用付錢 |
| 本機執行 | 所有東西跑在你的電腦上，不上傳雲端 |
| BYOK | 如果沒有 CLI agent，可以貼自己的 API Key 用 |

---

## 延伸閱讀

- [QUICKSTART 繁體中文版](https://github.com/nexu-io/open-design/blob/main/QUICKSTART.zh-TW.md)
- [Skills 協議文件](https://github.com/nexu-io/open-design/blob/main/docs/skills-protocol.md)
- [Design System 目錄](https://github.com/nexu-io/open-design/blob/main/design-systems/README.md)
- [Prompt 模板庫](https://github.com/nexu-io/open-design/blob/main/prompt-templates/)（93 個現成 prompt）
