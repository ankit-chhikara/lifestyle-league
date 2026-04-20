# 💰 Lifestyle League — Deploy Guide

Get a shareable link for your group in ~10 minutes. Identical process to Scholar's Guild.

---

## Step 1 — Supabase (free database)

1. Go to **https://supabase.com** → Sign up / Log in
2. Click **New Project** → name it `lifestyle-league` → Create
3. Wait ~1 min for the project to spin up
4. Go to **SQL Editor** → **New Query**
5. Open `SETUP.sql`, copy everything, paste it in, click **Run**
   - You'll see: "Success. No rows returned"
6. Go to **Settings → API**, copy:
   - **Project URL** → `https://xxxxxxxx.supabase.co`
   - **anon public** key → long string starting with `eyJ...`

> ⚠️ If you're already running Scholar's Guild on Supabase, you can use the **same project** — the tables have different names (`ll_players`, `ll_entries`) so there's no conflict. Just run the SETUP.sql there too.

---

## Step 2 — Edit index.html

Open `index.html` in any text editor and find these lines near the top:

```js
const SUPABASE_URL      = "YOUR_SUPABASE_URL";
const SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY";
```

Replace with your actual values:

```js
const SUPABASE_URL      = "https://xxxxxxxx.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6Ikp...";
```

Save the file.

---

## Step 3 — Deploy to GitHub + Vercel

### GitHub:
1. Go to **https://github.com** → New repository → name: `lifestyle-league` → Public → Create
2. Click **uploading an existing file** → drag in `index.html` + `SETUP.sql` → Commit

### Vercel:
1. Go to **https://vercel.com** → Add New → Project
2. Import your `lifestyle-league` repo
3. Leave all settings default → Deploy
4. You get a URL like:

```
https://lifestyle-league-xyz.vercel.app
```

**Share this with your group. Everyone logs their own monthly data.** 🎉

---

## How It Works

### Scoring
- **Score = Savings ÷ Choice Money** (Choice Money = Income − Fixed Locked Costs)
- Measures discipline (%), not raw dollar amounts — fair across all income levels
- 1 point per month if score ≥ 1%

### Power-Ups
| Power-Up | Bonus |
|---|---|
| 🔥 Streak | +1 pt |
| ⚡ Hustle (score ≥ 50%) | +0.5 pt |
| 💪 Resilience | +2 pt |
| 📈 Investor Bonus | +0.2 pt |
| 💸 Interest Paid | −0.5 pt |

### Safety Tokens
- HealthShield, YearlyPass, BigBuy×2 — use when a month has a valid planned expense
- Token months score 0 pts but don't break the streak

### Special Rules
- **Lifestyle Creep**: If Choice Money > 5,000 (your currency), must score ≥ 40% to earn point
- **Infant Sabbatical**: 1% compliance = 1 point (12-month window)
- **Debt Killer**: Extra debt payments count as savings
- **Windfall**: Tax refunds / inheritance = Bonus Round (not in monthly %)

### End Game
- Losers fund the winner's splurge
- Grand Finale tiebreak: highest average monthly score
- Still tied: most Hustle badges

---

## Using Same Supabase as Scholar's Guild?

Totally fine — just run `SETUP.sql` in the same project. Both games use different table names:
- Scholar's Guild: `players`, `sessions`
- Lifestyle League: `ll_players`, `ll_entries`
