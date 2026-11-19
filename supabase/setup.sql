-- Run ONLY in a new dedicated public-website Supabase project.
create table if not exists public.website_admins (user_id uuid primary key references auth.users(id) on delete cascade);
create table if not exists public.website_content (id integer primary key check(id=1), content jsonb not null, updated_at timestamptz not null default now());
alter table public.website_admins enable row level security;
alter table public.website_content enable row level security;
revoke all on public.website_admins from anon, authenticated;
grant select on public.website_admins to authenticated;
grant select on public.website_content to anon, authenticated;
grant insert, update on public.website_content to authenticated;
drop policy if exists "own admin membership" on public.website_admins;
create policy "own admin membership" on public.website_admins for select to authenticated using (user_id=auth.uid());
drop policy if exists "public read" on public.website_content;
create policy "public read" on public.website_content for select to anon,authenticated using (true);
drop policy if exists "admin insert" on public.website_content;
create policy "admin insert" on public.website_content for insert to authenticated with check (exists(select 1 from public.website_admins where user_id=auth.uid()));
drop policy if exists "admin update" on public.website_content;
create policy "admin update" on public.website_content for update to authenticated using (exists(select 1 from public.website_admins where user_id=auth.uid())) with check (exists(select 1 from public.website_admins where user_id=auth.uid()));
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types) values ('website-media','website-media',true,5242880,array['image/jpeg','image/png','image/webp','image/avif']) on conflict(id) do nothing;
drop policy if exists "website media admin upload" on storage.objects;
create policy "website media admin upload" on storage.objects for insert to authenticated with check (bucket_id='website-media' and exists(select 1 from public.website_admins where user_id=auth.uid()));
-- After creating an admin user via Authentication > Users, replace UUID and execute separately:
-- insert into public.website_admins(user_id) values ('YOUR-AUTH-USER-UUID');
-- Never insert private customer data, invoices or booking records into website_content; public read is intentional.
