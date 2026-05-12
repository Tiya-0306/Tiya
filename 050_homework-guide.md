# W12｜作業繳交指南

---

## 繳交項目

| # | 項目 | 格式 | 必繳 |
|---|------|------|------|
| 1 | **GitHub Pages 網址** | URL（能打開的） | ✅ |
| 2 | **網站至少 2 篇文章** | 線上可看到 | ✅ |
| 3 | **requirement.md** | 你自己寫的需求（至少 2 條 user story） | ✅ |
| 4 | 一稿多發版本 | 至少 2 個平台的版本（Markdown 或截圖） | 選做加分 |

---

## 怎麼繳交

在 Google 表單中填寫：

1. **你的 GitHub Pages 網址**
   - 格式：`https://你的帳號.github.io/repo名稱/`
   - 確認老師能打開、能看到文章

2. **你的 GitHub repo 網址**
   - 格式：`https://github.com/你的帳號/repo名稱`
   - 老師會看你的 commit 紀錄

3. **requirement.md 內容**
   - 直接貼在表單裡，或附上 repo 中的連結

4. **（選做）一稿多發版本**
   - 貼上你產出的 FB / X / IG 版本
   - 或截圖

---

## 評分標準

| 等級 | 條件 |
|------|------|
| ✅ 完成 | 網站能打開、有 2 篇文章、有 requirement |
| ⭐ 優秀 | 文章有完整 frontmatter、網站有客製化（標題/描述）、requirement 有深度 |
| 🌟 傑出 | 一稿多發、多篇文章、有自己的設計想法、commit 紀錄清楚 |

---

## 常見問題

### Q：網站打不開 / 404

1. 確認 GitHub repo → Settings → Pages → Source 是 **GitHub Actions**
2. 確認 `astro.config.mjs` 的 `base` 跟 repo 名稱一致
3. 到 repo → Actions 看部署有沒有成功（綠勾 = 成功）

### Q：我不會用 Git

跟 agent 說：
> 幫我把目前的修改 commit 並 push 到 GitHub

或用 IDE 的 Source Control 面板（左側邊欄的分支圖示）。

### Q：GitHub 帳號忘記密碼

到 [github.com](https://github.com) → Sign in → Forgot password

### Q：我上週沒有新聞稿

沒關係。用任何 Markdown 文章都行：
- 自己寫一篇短文
- 跟 AI 要一篇範例新聞稿
- 用課堂上老師提供的範例

### Q：可以用中文檔名嗎？

不建議。檔名用英文 kebab-case：`keelung-mrt.md`、`taipei-budget.md`。
中文標題放在 frontmatter 的 `title` 裡就好。

---

## 截止時間

下週上課前。
