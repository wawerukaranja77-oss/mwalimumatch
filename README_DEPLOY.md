# MwalimuMatch — production deployment

## 1. Register the domain
Recommended primary domain: `mwalimumatch.co.ke`. Also consider securing `mwalimumatch.com` if available.

## 2. Replace the placeholder domain
Replace every occurrence of `https://YOUR-DOMAIN.example/` in:
- `index.html`
- `robots.txt`
- `sitemap.xml`
with your real domain.

## 3. Deploy
Upload this folder to a static host such as Vercel, Netlify or Cloudflare Pages.

## 4. Connect the custom domain
Add the domain in the hosting provider, then follow its DNS instructions.

## 5. Supabase
Keep `config.js` with the Supabase project URL and publishable key. Never add a Supabase secret/service-role key to client-side code.

## 6. Google
After the domain is live:
- verify the domain/property in Google Search Console
- submit `https://YOUR-DOMAIN.example/sitemap.xml`
- use URL Inspection to test the homepage and request indexing

## 7. Before launch
- Replace demo teacher profiles with real, consented teacher data.
- Add a Privacy Policy and Terms page.
- Configure analytics and conversion tracking.
- Confirm booking/payment flows and Supabase Row Level Security.
