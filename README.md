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

Everything is saved in your phone's browser. Nothing is sent anywhere, and there are no accounts. Use **Settings → Save backup** now and then. If you change phones or clear your browser, restore from that file.

## Credit

The revision method was taught by Mohammad's Quran teacher. The app was built by Mohammad Mushtaha.

## Development

A static site with no build step: `index.html`, `sw.js` (offline cache) and `manifest.webmanifest`. It is served with GitHub Pages from the `main` branch.
