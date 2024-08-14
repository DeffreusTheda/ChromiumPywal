# Chromium pywal theme generator

Generates [pywal](https://github.com/dylanaraps/pywal) theme for Chromium-based browsers

![Preview](./preview.png)

## Usage

1. Run script `./generate-theme.sh`
2. Open chromium
3. Go to `chrome://extensions`
4. Turn on "Developer Mode" in the top right corner
5. Press "Load unpacked"
6. Select "Pywal" (by default) in the same folder with the script
7. ???
8. PROFIT!

However, you need to run this script and restart chromium each time you change pywal colors (or reload extension manually, since there is no way to do it automatically).
So, make an alias or something like that.
But you don't need to repeat the steps above, just run the script and that's it, chromium will update theme colors automatically. 😁

## Effie's work

Hi!

I just mainly restyled the code into my liking!<br>
There one new feature: destination folder as first argument! (That's all)

The main thing I wanna say here is that,
I encountered a bug, okay?
I'm using brave, tried this on one of my wallpaper and it's fine!
I then changed wallpapers, but suddenly Brave said "nuh uh", even when I reopen it...

The fix is to just reuse the background image from that working wallpaper for the new wallpaper!
I DON'T KNOW WHY THAT WORKS, but hey, at least it's working.

Aight, enjoy!
