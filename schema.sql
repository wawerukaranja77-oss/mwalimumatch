create extension if not exists pgcrypto;

create table if not exists public.teachers (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  initials text,
  subjects text[] not null default '{}',
  levels text[] not null default '{}',
  experience_years integer not null default 0,
  hourly_rate numeric(10,2) not null,
  rating numeric(2,1) not null default 5.0,
  reviews integer not null default 0,
  verified boolean not null default false,
  bio text,
  location text,
  lesson_types text[] not null default '{}',
  created_at timestamptz not null default now()
);

create table if not exists public.student_requests (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  subject text not null,
  phone text not null,
  level text,
  lesson_type text,
  created_at timestamptz not null default now()
);

alter table public.teachers enable row level security;
alter table public.student_requests enable row level security;

drop policy if exists "Public can read teachers" on public.teachers;
create policy "Public can read teachers" on public.teachers for select using (true);

drop policy if exists "Public can submit requests" on public.student_requests;
create policy "Public can submit requests" on public.student_requests for insert with check (true);

insert into public.teachers (name, initials, subjects, levels, experience_years, hourly_rate, rating, reviews, verified, bio, location, lesson_types)
select * from (values
('Jane Mwangi','JM',ARRAY['Mathematics'],ARRAY['Secondary — Form 1–4'],6,900,4.9,32,true,'Mathematics specialist focused on exam confidence and strong fundamentals.','Nairobi',ARRAY['Online','In person']),
('David Kariuki','DK',ARRAY['Physics','Mathematics'],ARRAY['Secondary — Form 1–4'],5,800,4.8,27,true,'Physics and Mathematics tutor with a practical, problem-solving approach.','Nairobi',ARRAY['Online','In person']),
('Ann Wanjiku','AW',ARRAY['English','Kiswahili'],ARRAY['Primary','Secondary — Form 1–4'],4,750,5.0,18,true,'Language tutor helping learners communicate clearly and prepare for examinations.','Nairobi',ARRAY['Online','In person'])
) as v(name, initials, subjects, levels, experience_years, hourly_rate, rating, reviews, verified, bio, location, lesson_types)
where not exists (select 1 from public.teachers);
