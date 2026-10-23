# Muraja'ah Planner

A phone app for planning daily Quran revision (muraja'ah) by strength.

Each memorised quarter of a juz is marked **red** (weak), **yellow** (shaky) or **green** (solid). Each day the app picks what to read:

- **Reds:** the earliest red in mushaf order. You stay on it until it improves.
- **Yellows and greens:** each rotates, starting with the quarter you read longest ago.
- **Weekends:** no greens. More reds and yellows instead, plus one locked block.
- **Locked blocks:** when all 20 quarters in a 5-juz block are green, the block locks and is revised as one unit at the weekend.

After each read you tap the colour it was. Quarters move between red, yellow and green as they get stronger or weaker.

## Use it

Open the site on your phone, then add it to your home screen:

- **iPhone (Safari):** Share, then "Add to Home Screen".
- **Android (Chrome):** the ⋮ menu, then "Add to Home screen".

It works offline once it has loaded.

## Your data

The phone is always the working copy, so the app works offline and without an account.

- **Signed out:** everything is saved in your phone's browser and nothing is sent anywhere. Use **Settings → Save backup** now and then.
- **Signed in** (Settings → Account, with email and password): your data is also synced to your account, so it follows you to other devices and survives a lost phone. Each person can only read and change their own data, which is enforced by the database's row-level security. If two devices have different changes, the most recent one wins.
- **Signing out** removes the data from that phone. It stays in your account.

## Setting up sign-in (one time, for whoever hosts the app)

1. Create a free project at [supabase.com](https://supabase.com).
2. **SQL Editor → New query:** paste [`supabase/setup.sql`](supabase/setup.sql) and run it.
3. **Authentication → URL Configuration:** set the Site URL to the app's address (`https://mushtaha1.github.io/murajaah-planner/`) and add the same address under Redirect URLs. Confirmation and password-reset links land there.
4. **Project Settings → API:** copy the Project URL and the publishable (anon) key into [`config.js`](config.js). This key is designed to be public; row-level security protects the data. Never put the `service_role` or secret key here.

Supabase's built-in email sender only sends a few emails an hour (sign-up confirmations and password resets). Before opening sign-in to more than a handful of people, add your own SMTP provider under Authentication → SMTP Settings.

## Credit

The revision method was taught by Mohammad's Quran teacher. The app was built by Mohammad Mushtaha.

## Development

A static site with no build step: `index.html`, `config.js` (sign-in settings), `sw.js` (offline cache), `manifest.webmanifest` and `supabase/setup.sql`. It is served with GitHub Pages from the `main` branch. Sign-in uses [supabase-js](https://github.com/supabase/supabase-js) 2.45.4 from jsDelivr.
