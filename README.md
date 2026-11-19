# Animzielan.com — Website V1.0

Tema: Midnight Navy, Off White, Muted Gold. Next.js App Router + Supabase. Laman ini berasingan daripada sistem.animzielan.com dan tidak menggunakan data kewangan atau pelanggan sedia ada.

## 1. GitHub dan Vercel
1. Extract ZIP. Upload isi folder projek ke repository GitHub baharu (package.json mesti di root). Jangan upload fail .env.local.
2. Vercel → Add New Project → Import repository. Framework Next.js. Untuk paparan awal boleh deploy tanpa Supabase; laman awam menggunakan starter data.
3. Untuk Admin, buat projek Supabase baharu khusus untuk website (jangan guna database kewangan). SQL Editor → New query → paste keseluruhan supabase/setup.sql → Run.
4. Authentication → Users → Add user. Gunakan email yang dibenarkan dan kata laluan yang kuat. Copy UUID pengguna, kemudian run query berikut dengan UUID sebenar dalam SQL Editor:
   ```sql
   insert into public.website_admins(user_id) values ('YOUR-AUTH-USER-UUID');
   ```
   Disable public signup dalam Authentication settings jika tidak diperlukan.
5. Vercel → Settings → Environment Variables. Masukkan NEXT_PUBLIC_SUPABASE_URL dan NEXT_PUBLIC_SUPABASE_ANON_KEY (anon/public key sahaja; jangan gunakan service role key). Redeploy.
6. Buka /admin dan login. Ubah profile, contact, harga, portfolio, artwork, logo, statistik dan testimoni. Klik Save & publish. Semua data di dalam website_content adalah awam: jangan masukkan data peribadi, rekod pelanggan atau rahsia di situ.
7. Upload gambar JPEG/PNG/WEBP/AVIF di bawah 5 MB. Gambar disimpan dalam bucket website-media yang public; hanya admin boleh upload. Padam entry tidak memadam fail storage; urus fail lama di Supabase jika diperlukan.

## 2. Domain
Vercel → projek website baharu → Settings → Domains → Add animzielan.com dan www.animzielan.com. Ikut nilai DNS yang dipaparkan Vercel untuk domain anda di Exabytes. Jangan padam atau ubah rekod DNS sistem.animzielan.com, MX/email atau rekod lain yang tidak berkaitan. Pastikan kedua-dua website dan sistem lama berfungsi selepas perubahan DNS.

## 3. Halaman
- / Home
- /about About & company registration
- /portfolio Selected content projects (filter + detail popup)
- /emcee Emcee portfolio
- /gallery Artwork gallery
- /rates Starting rates, price on request jika belum ditetapkan; Print / Save as PDF melalui browser
- /contact Link-in-bio & booking enquiry (WhatsApp, jika nombor awam ditetapkan dalam admin)
- /admin Admin login & website content manager

Maklumat syarikat: Anim Zielan Media Artwork | SSM: SA0642429-P. Boleh edit di Admin > Profile & company.

## 4. Sebelum launch
- Masukkan portrait/official logo (logo sendiri melalui Profile & company; logo jenama pelanggan melalui Brand partners; monogram AZ dipaparkan jika logo belum dimasukkan), foto MC, artwork serta pautan video rasmi.
- Semak angka tontonan (snapshot 19 Nov 2026, bukan data live). Sebahagian thumbnail contoh ialah crop screenshot TikTok yang dibekalkan; gantikan dengan gambar/video asal. Logo partner, gambar Momoyo dan Zen by Stellar masih kosong.
- Tetapkan harga sebenar, contact WhatsApp dalam format 601..., email awam dan pautan media sosial rasmi. Borang enquiry membuka WhatsApp dengan mesej pra-isi; tiada rekod enquiry dihantar ke database.
- Semua teks website versi ini dalam English. Tiada language switcher; boleh tambah kemudian jika perlu.
- Uji mobile, navigation, login, upload, save, rate card print, popup dan WhatsApp selepas deploy. Projek ini belum dipasang dependencies atau diuji di Vercel/Supabase dalam sesi penciptaan; syntax JSX diperiksa sahaja.

Local (Node >=20): `npm install`, copy `.env.example` ke `.env.local` dan isi nilai jika diperlukan, `npm run dev`. `npm run build` untuk semakan production.
