# W12｜發布：把新聞稿變成網站

> 🎯 本週目標：用 Astro 建一個新聞網站，部署到 GitHub Pages，拿到一個真的網址

| 📝 [本日作業](https://docs.google.com/forms/d/e/1FAIpQLSeQFuR_TRLxEQxLNV99Nlzp5cYodIfO792l2B6TVTRqHhmluQ/viewform) | 🎬 [本日錄影](https://youtube.com/live/pXr4e4NcmhM) |
|---|---|

---

## 🧭 這週你的角色

上週你是**文字記者**——把聲音變成文字，寫成新聞。
這週你是**發行人**——把新聞稿放到網路上，讓全世界看得到。

上週的產出是 Markdown 檔案，存在你的電腦裡。
這週的產出是一個**有網址的網站**，任何人都能打開。

---

## 學習目標

1. **用 Astro 建立靜態新聞網站** — Markdown 直接變網頁
2. **部署到 GitHub Pages** — 免費、有 HTTPS、有自己的網址
3. **理解靜態網站 vs 動態網站** — 為什麼記者需要知道這個
4. **Git 基礎操作** — push 你的網站上線
5. **（選做）一稿多發** — 同一篇新聞稿轉成 IG/X/FB 版本

---

## 📖 名詞解釋

| 名詞 | 白話文 |
|------|--------|
| **Astro** | 一個靜態網站框架。你寫 Markdown，它幫你變成漂亮的網頁。不需要資料庫。 |
| **靜態網站** | 不需要伺服器即時運算的網站。速度快、安全、免費託管。適合新聞、部落格、作品集。 |
| **GitHub Pages** | GitHub 提供的免費網站託管。把程式碼 push 上去，自動變成網站。 |
| **Git** | 版本控制工具。記錄每次修改，可以回到任何版本。像文件的時光機。 |
| **Deploy（部署）** | 把你的網站從電腦上傳到伺服器，讓全世界都能看到。 |
| **Markdown** | 你已經會了。Astro 直接把 .md 檔案變成網頁。 |
| **npm** | Node.js 的套件管理工具。用來安裝 Astro。 |
| **Template（模板）** | 別人做好的網站骨架。你只要換內容就好。 |

## 🔑 關鍵字

`Astro` `靜態網站` `GitHub Pages` `Git` `Deploy` `Markdown` `npm` `Template` `SSG`

---

## 🔧 本週工具

| 工具 | 用途 | 狀態 |
|------|------|------|
| [Astro](https://astro.build) | 靜態網站框架 | 本週安裝 |
| [GitHub](https://github.com) | 程式碼託管 + 免費網站 | 需要帳號 |
| Git | 版本控制 | IDE 內建 |
| Node.js + npm | 跑 Astro | W10 已裝 |
| kiro-cli / codex / gemini | AI 助手 | W10 已裝 |

---

## 為什麼要學這個？

你已經會寫 Markdown、會用 AI 寫新聞稿。但這些東西存在你的電腦裡，**沒有人看得到**。

記者的工作不只是寫稿——還要**發稿**。

| 發布方式 | 優點 | 缺點 |
|----------|------|------|
| WordPress | 功能多、有後台 | 要付主機費、慢、容易被駭 |
| Medium / 方格子 | 免費、有讀者 | 不是你的、隨時可能關站 |
| **GitHub Pages** | **免費、快、你擁有一切** | 要會 Git（今天教你） |

GitHub Pages 是記者的**作品集最佳選擇**：
- 免費
- 你的網址（`username.github.io`）
- 不會被平台下架
- 面試時直接給連結

---

## 完整流程

```
建立 Astro 專案 → 放入新聞稿 → 本機預覽 → push 到 GitHub → 自動部署 → 拿到網址
```

---

## 本週檔案

| 檔案 | 內容 |
|------|------|
| [020_requirement.md](020_requirement.md) | ⚠️ 需求模板——你要自己填寫 |
| [025_spec.md](025_spec.md) | Astro + GitHub Pages 技術規格 |
| [030_tasks.md](030_tasks.md) | 課堂任務清單 |
| [040_prompts.md](040_prompts.md) | 範例 Prompt + 自己組裝區 |
| [050_homework-guide.md](050_homework-guide.md) | 作業繳交指南 |

---

## 靜態 vs 動態：一張圖

```
靜態網站（Astro / GitHub Pages）：
  你寫 Markdown → 編譯成 HTML → 放到 CDN → 讀者直接拿 HTML
  ✅ 快、安全、免費、不會掛

動態網站（WordPress）：
  讀者請求 → 伺服器查資料庫 → 組合 HTML → 回傳給讀者
  ✅ 功能多、有後台、可以登入
  ❌ 慢、要付錢、可能被駭
```

---

## ⚖️ 倫理提醒

- 發布的內容就是公開的。確認你的新聞稿已經校稿完畢再上線
- GitHub Pages 的內容會被 Google 索引。不要放未經確認的資訊
- 圖片注意著作權。用自己拍的、CC0 授權的、或 AI 生成的

## 💰 成本提醒

全部免費。Astro 開源免費。GitHub Pages 免費。AI 用免費額度。
