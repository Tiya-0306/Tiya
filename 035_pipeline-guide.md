# W12｜Pipeline Guide：從新聞稿到上線網站

> 📋 這份文件是給你的 agent 看的。把每一段的 prompt 貼給它，它會幫你做。
> 你的工作：貼 prompt → 看結果 → 確認 → 貼下一段。

---

## Phase 1：建立網站專案

### Step 1.1 建專案

把這段貼給 agent：

```
幫我用 Astro 建一個新聞網站。

要求：
- 用 blog template
- 不要 TypeScript
- 網站標題改成「___新聞」（你自己取名）
- 建完後跑 npm run dev 讓我預覽
- 告訴我預覽網址是什麼
```

✅ 確認：瀏覽器打開預覽網址，看到一個部落格網站了嗎？

---

### Step 1.2 放入你的新聞稿

把這段貼給 agent（把「你的新聞稿」換成你上週寫的內容）：

```
把以下新聞稿轉成 Astro blog 文章格式，放進專案裡。

要求：
- 加上 frontmatter（title、description、pubDate、tags）
- description 用一句話摘要
- 檔名用英文（例如 keelung-mrt.md）
- 放完後確認首頁有顯示

新聞稿：
（貼上你的新聞稿）
```

沒有新聞稿？貼這段：

```
幫我寫一篇 300 字的範例新聞稿，主題是校園附近的美食推薦。
用 Astro blog 格式，放進專案裡。
```

✅ 確認：重新整理瀏覽器，首頁列表有你的文章了嗎？點進去看得到完整內容嗎？

---

## Phase 2：推上 GitHub，讓全世界看到

### Step 2.1 建 GitHub repo + 部署

把這段貼給 agent：

```
幫我把這個 Astro 專案部署到 GitHub Pages。

步驟：
1. 用 gh CLI 建一個 public repo（名稱叫 my-news）
2. 設定 astro.config.mjs 的 site 和 base
3. 建立 .github/workflows/deploy.yml（GitHub Actions 自動部署）
4. 全部 commit 並 push
5. 告訴我怎麼在 GitHub Settings 啟用 Pages

我的 GitHub 帳號是：___（填你的帳號）
```

⚠️ 如果 agent 說你沒登入 GitHub，貼這段：

```
幫我登入 GitHub CLI（gh auth login），用瀏覽器方式。
```

---

### Step 2.2 啟用 GitHub Pages

agent 會告訴你去哪裡設定。通常是：

1. 打開你的 GitHub repo 網頁
2. Settings → Pages
3. Source 選 **GitHub Actions**
4. 儲存

等 1-2 分鐘。

✅ 確認：打開 `https://你的帳號.github.io/my-news/` — 網站上線了嗎？

---

## Phase 2.5：選一個色彩計畫（30 秒）

跟 agent 說：

```
我的新聞網站要用什麼配色？

給我 3 個方案，每個方案包含：
- 主色（Primary）
- 強調色（Accent）
- 背景色（Background）
- 文字色（Text）
- 用一句話說明這個配色的感覺

我的網站主題是：___（新聞/生活/科技/校園）
```

或者直接選一個現成的：

| 風格 | 主色 | 強調色 | 背景 | 適合 |
|------|------|--------|------|------|
| 經典報紙 | `#1a1a1a` | `#c0392b` | `#FAFAF8` | 嚴肅新聞 |
| 現代科技 | `#0f172a` | `#3b82f6` | `#f8fafc` | 科技報導 |
| 溫暖生活 | `#292524` | `#ea580c` | `#fef3c7` | 生活/美食 |
| 校園清新 | `#1e3a5f` | `#10b981` | `#f0fdf4` | 校園新聞 |
| 暗色模式 | `#ffffff` | `#a78bfa` | `#0f0f0f` | 夜間閱讀 |

選好後跟 agent 說：

```
把我的 Astro 網站配色改成：
- 主色：___
- 強調色：___
- 背景：___
改完後 commit 並 push。
```

---

## Phase 3：客製化

### Step 3.1 改外觀

```
幫我修改這個 Astro 網站：
1. 網站標題改成「___」
2. 首頁的自我介紹改成「___」
3. 改完後 commit 並 push
```

### Step 3.2 加更多文章

```
幫我再加 2 篇文章到 Astro blog 裡。

文章 1 主題：___
文章 2 主題：___

每篇 200 字以上，要有 frontmatter。
加完後 commit 並 push。
```

✅ 確認：等部署完成（1-2 分鐘），重新整理你的網站，新文章出現了嗎？

---

## Phase 4：一稿多發（選做，加分）

### Step 4.1 產出社群版本

```
把以下新聞稿轉成 3 個平台的版本：

1. Facebook 貼文（500 字以內，口語化，加 3-5 個 hashtag）
2. X/Twitter（280 字以內，精煉，附 [LINK] 佔位符）
3. Instagram caption（200 字以內，加 emoji，10 個 hashtag 放最後）

原文：
（貼上你的新聞稿）
```

### Step 4.2 產出 IG 圖卡（用 Open Design 或 UI UX Pro Max）

```
做一組 3 張 1080×1080 的 IG 輪播圖。

主題：（你的新聞稿標題）
風格：Editorial Monocle
語言：繁體中文
每張一個重點，從新聞稿裡挑 3 個關鍵訊息。
```

---

## Phase 5：寫 requirement（5 分鐘）

這段你自己寫，不要叫 agent 寫。

打開 `020_requirement.md`，寫至少 2 條 user story：

```
作為___，我想要___，以便___。
```

想想看：
- 如果你每週要發 3 篇文章，哪些步驟可以自動化？
- 你的網站需要什麼功能？（分類？搜尋？RSS？）

---

## 🎯 今天的產出

下課前你要有：

| # | 項目 | 怎麼確認 |
|---|------|---------|
| 1 | 一個能打開的網址 | 貼到表單裡，老師能打開 |
| 2 | 網站上至少 2 篇文章 | 老師點進去看得到 |
| 3 | requirement.md | 你自己寫的，至少 2 條 |
| 4 | （選做）社群版本 | FB/X/IG 任兩個 |

---

## 🆘 卡住了？

把錯誤訊息貼給 agent：

```
我的 GitHub Actions 部署失敗了。錯誤訊息是：

（貼上錯誤訊息）

幫我修好。
```

或者：

```
我的網站打開是 404。
我的 repo 名稱是 ___。
我的 astro.config.mjs 裡 base 設定是 ___。
幫我檢查哪裡設錯了。
```
