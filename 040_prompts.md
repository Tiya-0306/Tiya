# W12｜範例 Prompt

---

## Phase 1：建站

### Prompt 1：讓 agent 幫你建 Astro 專案

```
幫我用 Astro 建一個新聞網站。

要求：
- 用 blog template
- 不要 TypeScript
- 網站標題：「___新聞」
- 建完後跑 npm run dev 讓我預覽
```

### Prompt 2：把新聞稿轉成 Astro 文章格式

```
把以下新聞稿轉成 Astro blog 文章格式。

要求：
- 加上 frontmatter（title、description、pubDate、tags）
- description 用一句話摘要，30 字以內
- tags 用 3-5 個關鍵字
- 檔名用英文 kebab-case（例如 keelung-mrt-controversy.md）

新聞稿：
[貼上你的新聞稿]
```

---

## Phase 2：部署

### Prompt 3：讓 agent 幫你部署

```
幫我把這個 Astro 專案部署到 GitHub Pages。

步驟：
1. 設定 astro.config.mjs 的 site 和 base
2. 建立 .github/workflows/deploy.yml
3. 用 gh CLI 建 repo 並 push
4. 告訴我怎麼在 GitHub Settings 啟用 Pages

我的 GitHub 帳號是：___
repo 名稱要叫：___
```

### Prompt 4：部署出問題時

```
我的 GitHub Actions 部署失敗了。錯誤訊息是：

[貼上錯誤訊息]

幫我修好。
```

---

## Phase 3：客製化

### Prompt 5：改網站外觀

```
幫我修改這個 Astro blog 網站：
1. 網站標題改成「___」
2. 首頁的自我介紹改成「___」
3. 導覽列加一個「關於」頁面
4. 改完後 commit 並 push
```

### Prompt 6：批次加文章

```
我有以下 3 篇新聞稿，幫我全部轉成 Astro blog 文章格式，放到 src/content/blog/ 裡。

每篇都要有：
- frontmatter（title、description、pubDate、tags）
- 適當的檔名

文章 1：
[貼上]

文章 2：
[貼上]

文章 3：
[貼上]
```

---

## Phase 4：一稿多發

### Prompt 7：一次產出多平台版本

```
把以下新聞稿轉成 4 個平台的版本：

1. Facebook 貼文（500 字以內，口語化，加 3-5 個 hashtag）
2. X/Twitter（280 字以內，精煉，附連結佔位符 [LINK]）
3. Instagram caption（200 字以內，加 emoji，10 個 hashtag 放最後）
4. LINE 推播摘要（100 字以內，一句話重點 + 連結）

原文：
[貼上你的新聞稿]
```

### Prompt 8：分析平台差異

```
比較以下同一篇新聞在不同平台的版本：

[貼上你產出的多平台版本]

請分析：
1. 哪些資訊在短版本中被刪除了？這些刪除合理嗎？
2. 語氣在不同平台有什麼變化？
3. 如果你是編輯，你會怎麼修改這些版本？
```

---

## 🔧 自己組裝 Prompt

### 零件盒

| 零件類型 | 範例 |
|----------|------|
| **角色** | 前端工程師 / 社群編輯 / SEO 專家 / 發行人 |
| **任務** | 建站 / 部署 / 轉格式 / 寫 metadata / 產出多平台版本 |
| **限制** | 用 Astro / 部署到 GitHub Pages / 不要 TypeScript / 繁體中文 |
| **輸出格式** | Markdown + frontmatter / deploy.yml / 社群貼文 |

### 💡 進階挑戰

- 「幫我設定 RSS feed，讓讀者可以訂閱」
- 「幫我加 Google Analytics 追蹤碼」
- 「幫我設定自訂網域（我有 xxx.com）」
- 「幫我做一個自動化：每次 push 新文章，自動產出 X 和 FB 版本」
