# W12｜任務清單

## 課前準備（5 分鐘）

### 0. 確認工具

```bash
node --version   # 需要 v18+
git --version    # 需要有
```

如果沒有，跟 agent 說：`幫我安裝 Node.js 和 Git`

### 0.1 GitHub 帳號

如果還沒有 GitHub 帳號：
1. 到 [github.com](https://github.com) 註冊
2. 用學校 email 或個人 email 都可以
3. 帳號名稱建議用英文、好記的（這會變成你的網址）

---

## Phase 1：建立 Astro 專案（10 分鐘）

### 1.1 建專案

```bash
npm create astro@latest my-news-site
```

選項這樣選：
- Where should we create your new project? → `my-news-site`
- How would you like to start your new project? → **Use blog template**
- Do you plan to write TypeScript? → **No**
- Install dependencies? → **Yes**
- Initialize a new git repository? → **Yes**

完成後：

```bash
cd my-news-site
npm run dev
```

- [ ] 打開 `http://localhost:4321`，看到 Astro 預設部落格

### 1.2 放入你的新聞稿

把上週的新聞稿（或任何 Markdown 文章）放進 `src/content/blog/`：

```bash
# 建立新文章
touch src/content/blog/keelung-mrt.md
```

在檔案開頭加 frontmatter：

```markdown
---
title: "你的新聞標題"
description: "一句話摘要"
pubDate: "2025-05-05"
---

（你的新聞稿內容）
```

- [ ] 新文章出現在首頁列表
- [ ] 點進去能看到完整內容

> 💡 沒有上週的新聞稿？用任何 Markdown 文章都行。或跟 agent 說：「幫我寫一篇 300 字的範例新聞稿，主題隨意，要有 frontmatter」

---

## Phase 2：部署到 GitHub Pages（10 分鐘）

### 2.1 建 GitHub repo

**方法 A（推薦）：用 GitHub CLI**

```bash
gh auth login          # 第一次要登入
gh repo create my-news --public --source=. --push
```

**方法 B：手動**

1. 到 github.com → New repository → 名稱填 `my-news` → Create
2. 回到終端機：

```bash
git remote add origin https://github.com/你的帳號/my-news.git
git branch -M main
git push -u origin main
```

- [ ] 在 GitHub 上看到你的程式碼

### 2.2 設定 Astro

編輯 `astro.config.mjs`，加入 `site` 和 `base`：

```javascript
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://你的帳號.github.io',
  base: '/my-news',
});
```

> ⚠️ `base` 要跟你的 repo 名稱一致

### 2.3 加入自動部署

跟 agent 說：

> 幫我建立 GitHub Actions 的部署設定，把 Astro 網站部署到 GitHub Pages。建立 `.github/workflows/deploy.yml`。

或手動建立（見 [025_spec.md](025_spec.md) 的 deploy.yml）。

### 2.4 啟用 GitHub Pages

1. 到你的 repo → Settings → Pages
2. Source 選 **GitHub Actions**
3. 儲存

### 2.5 Push 上線

```bash
git add .
git commit -m "deploy to github pages"
git push
```

等 1-2 分鐘，到 repo → Actions 確認綠勾。

- [ ] 打開 `https://你的帳號.github.io/my-news/` — **你的網站上線了！**

---

## Phase 3：客製化（10 分鐘）

### 3.1 改網站標題和資訊

跟 agent 說：

> 幫我把這個 Astro 網站的標題改成「___新聞」，描述改成「___」

或自己改 `src/consts.ts`（或 `src/config.ts`，看模板）。

### 3.2 加更多文章

在 `src/content/blog/` 裡多放幾篇 `.md`：

- [ ] 至少 2 篇文章
- [ ] 每篇都有 frontmatter（title、description、pubDate）
- [ ] 首頁列表正確顯示

### 3.3 Push 更新

```bash
git add .
git commit -m "add articles"
git push
```

等部署完成，重新整理網站。

- [ ] 新文章出現在線上網站

---

## Phase 4：一稿多發（選做，10 分鐘）

把你的新聞稿轉成不同平台的版本。

### 4.1 用 AI 產出多平台版本

跟 agent 說（見 [040_prompts.md](040_prompts.md)）：

> 把這篇新聞稿轉成：
> 1. Facebook 貼文版（500 字 + hashtag）
> 2. X (Twitter) 版（280 字以內 + 連結）
> 3. Instagram caption（200 字 + emoji + hashtag）

- [ ] 拿到至少 2 個平台的版本
- [ ] 比較：哪些資訊被刪了？語氣怎麼變？

### 4.2 思考

- 哪個平台的版本最難寫？為什麼？
- AI 產出的版本，你會直接發嗎？要改什麼？
- 如果你是編輯，你會怎麼決定「這篇要發到哪些平台」？

---

## Phase 5：寫 requirement（5 分鐘）

打開 `020_requirement.md`，寫至少 2 條 user story。

想想看：
- 如果你每週要發 3 篇文章到網站上，流程怎麼自動化？
- 校稿 → 發布 → 社群推廣，哪些步驟可以讓 agent 做？
- 你的網站需要什麼功能？（分類？搜尋？RSS？）

- [ ] 寫完 requirement.md

---

## 🎯 本週產出

📎 繳交：

| # | 項目 | 格式 | 必繳 |
|---|------|------|------|
| 1 | GitHub Pages 網址 | URL | ✅ |
| 2 | 網站至少 2 篇文章 | 線上可看 | ✅ |
| 3 | requirement.md | 你自己寫的需求 | ✅ |
| 4 | 一稿多發版本（至少 2 平台） | Markdown 或截圖 | 選做 |

---

## ⚖️ 倫理提醒

- 發布 = 公開。確認內容已校稿再上線
- 圖片注意著作權
- 不要發布未經確認的資訊

## 💰 成本提醒

全部免費。Astro 開源。GitHub Pages 免費。AI 用免費額度。
