# W12｜技術規格：Astro + GitHub Pages

---

## Astro 是什麼

Astro 是一個靜態網站產生器（SSG）。你寫 Markdown，它編譯成 HTML。

- 官網：[astro.build](https://astro.build)
- 特色：Markdown-first、零 JavaScript（預設）、超快
- 適合：部落格、新聞網站、作品集、文件站

### 為什麼選 Astro 不選 Hugo / Jekyll？

| | Astro | Hugo | Jekyll |
|---|---|---|---|
| 語言 | JavaScript/Node.js | Go | Ruby |
| 學習曲線 | 低（Markdown 就能用） | 中 | 中 |
| 模板生態 | 豐富 | 豐富 | 老舊 |
| GitHub Pages 支援 | ✅ 官方文件 | ✅ | ✅（GitHub 預設） |
| 你已經裝了 Node.js | ✅ W10 裝的 | ❌ 要另外裝 | ❌ 要另外裝 |

---

## GitHub Pages 是什麼

GitHub 提供的免費靜態網站託管。

- 網址格式：`https://username.github.io/repo-name/`
- 免費額度：無限（公開 repo）
- HTTPS：自動
- 自訂網域：支援（選做）
- 部署方式：GitHub Actions（自動）

---

## 建立 Astro 專案

### 方法 1：CLI 建立（推薦）

```bash
npm create astro@latest my-news-site
```

選項：
- Template → Blog
- TypeScript → No
- Install dependencies → Yes

### 方法 2：讓 agent 幫你建

> 幫我用 Astro 建一個新聞網站。用 blog template，不要 TypeScript。

---

## 專案結構

```
my-news-site/
├── src/
│   ├── content/        ← 你的文章放這裡（Markdown）
│   │   └── blog/
│   │       ├── first-post.md
│   │       └── second-post.md
│   ├── layouts/        ← 頁面版型
│   ├── pages/          ← 路由
│   └── styles/         ← CSS
├── public/             ← 靜態檔案（圖片等）
├── astro.config.mjs    ← Astro 設定
└── package.json
```

---

## 文章格式（Markdown + Frontmatter）

```markdown
---
title: "基隆捷運規劃再生變：交通部要求臺鐵與捷運二選一"
description: "交通部長王國材表示基隆到八堵路段空間不足，引發爭議"
pubDate: "2025-05-05"
heroImage: "/images/keelung-station.jpg"
tags: ["交通", "基隆", "捷運"]
---

基隆新軌道建設構想提出近20年...
```

Frontmatter（`---` 之間的部分）是文章的 metadata。Astro 會用它來產生標題、日期、SEO 標籤。

---

## 本機預覽

```bash
cd my-news-site
npm run dev
```

打開 `http://localhost:4321` 就能看到你的網站。

---

## 部署到 GitHub Pages

### Step 1：建 GitHub repo

```bash
# 在專案目錄內
git init
git add .
git commit -m "first commit"
```

到 GitHub 建一個新 repo（名稱隨意，例如 `my-news`），然後：

```bash
git remote add origin https://github.com/你的帳號/my-news.git
git branch -M main
git push -u origin main
```

### Step 2：設定 Astro for GitHub Pages

編輯 `astro.config.mjs`：

```javascript
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://你的帳號.github.io',
  base: '/my-news',
});
```

### Step 3：加入 GitHub Actions

建立 `.github/workflows/deploy.yml`：

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm run build
      - uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
```

### Step 4：啟用 GitHub Pages

GitHub repo → Settings → Pages → Source → GitHub Actions

### Step 5：Push 並等待

```bash
git add .
git commit -m "add deploy workflow"
git push
```

等 1-2 分鐘，打開 `https://你的帳號.github.io/my-news/` — 網站上線了。

---

## 一稿多發（選做）

把同一篇新聞稿轉成不同平台的版本：

| 平台 | 格式 | 字數 |
|------|------|------|
| 網站（Astro） | 完整 Markdown | 無限 |
| Facebook | 中長文 + hashtag | ~500 字 |
| X (Twitter) | 精煉 + 連結 | 280 字 |
| Instagram | 圖文 caption | ~200 字 |
| LINE | 摘要 + 連結 | ~100 字 |

用 AI 一次產出所有版本 — 見 [040_prompts.md](040_prompts.md)。

---

## 常見問題

| 問題 | 解法 |
|------|------|
| `npm create astro` 失敗 | 確認 Node.js 已安裝：`node --version`（需要 v18+） |
| `git push` 被拒絕 | 確認已登入 GitHub：`gh auth login` 或用 HTTPS token |
| 網站 404 | 確認 `astro.config.mjs` 的 `base` 設定跟 repo 名稱一致 |
| 圖片不顯示 | 圖片放在 `public/` 目錄，路徑用 `/images/xxx.jpg` |
| GitHub Actions 失敗 | 到 repo → Actions 頁面看錯誤訊息，通常是 Node 版本問題 |
