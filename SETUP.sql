-- ═══════════════════════════════════════════════════════════
--  LIFESTYLE LEAGUE — Supabase Database Setup
--  Paste this entire file into: Supabase → SQL Editor → Run
-- ═══════════════════════════════════════════════════════════

-- 1. PLAYERS TABLE
create table if not exists ll_players (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  currency   text default '₹',
  created_at timestamptz default now()
);

-- 2. ENTRIES TABLE (one row per player per month)
create table if not exists ll_entries (
  id                 uuid primary key default gen_random_uuid(),
  player_id          uuid references ll_players(id) on delete cascade,
  player_name        text,              -- denormalized for leaderboard speed
  month              text not null,     -- YYYY-MM format

  -- Core financials
  income             numeric default 0,
  fixed_costs        numeric default 0,
  choice_money       numeric default 0,
  savings            numeric default 0,

  -- Power-ups (booleans)
  pu_streak          boolean default false,
  pu_hustle          boolean default false,
  pu_resilience      boolean default false,
  investor_bonus     boolean default false,
  debt_killer_bonus  boolean default false,
  interest_paid      boolean default false,

  -- Safety tokens
  token_used         text default null,  -- 'health' | 'yearly' | 'bigbuy1' | 'bigbuy2' | null

  -- Special modes
  sabbatical_mode    boolean default false,
  sabbatical_pct     numeric default null,

  notes              text default '',
  created_at         timestamptz default now()
);

-- 3. ROW LEVEL SECURITY — open read/write for friend-group use
alter table ll_players enable row level security;
alter table ll_entries  enable row level security;

create policy "Public read players"   on ll_players for select using (true);
create policy "Public insert players" on ll_players for insert with check (true);
create policy "Public delete players" on ll_players for delete using (true);

create policy "Public read entries"   on ll_entries for select using (true);
create policy "Public insert entries" on ll_entries for insert with check (true);
create policy "Public delete entries" on ll_entries for delete using (true);

-- ═══════════════════════════════════════════════════════════
-- Done! Tables are ready.
-- Now paste your Supabase URL + anon key into index.html
-- ═══════════════════════════════════════════════════════════
