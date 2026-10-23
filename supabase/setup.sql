-- Muraja'ah Planner: database setup.
-- Run once in Supabase: SQL Editor -> New query -> paste -> Run.
-- One row per signed-in person holds their whole revision state.

create table if not exists public.revision_state (
  user_id    uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now(),
  constraint data_size check (pg_column_size(data) < 512000)
);

-- Row-level security: each person can only see and change their own row.
alter table public.revision_state enable row level security;

drop policy if exists "read own"   on public.revision_state;
drop policy if exists "insert own" on public.revision_state;
drop policy if exists "update own" on public.revision_state;
drop policy if exists "delete own" on public.revision_state;

create policy "read own"   on public.revision_state for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own" on public.revision_state for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own" on public.revision_state for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "delete own" on public.revision_state for delete to authenticated using ((select auth.uid()) = user_id);

-- Signed-out visitors get nothing.
revoke all on public.revision_state from anon;
