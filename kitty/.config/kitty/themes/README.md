# Kitty Themes
There are 2 ways you can add and use themes in Kitty. Themes come from the [kitty-themes repo](https://github.com/kovidgoyal/kitty-themes). 

## Built-in themes
1. Run `kitten themes` to open an interactive browser to preview and pick a theme.
2. Choose "Modify kitty.conf" when prompted.
3. Saves the theme to `~/.config/kitty/current-theme.conf` and adds
  `include current-theme.conf` to `kitty.conf`.
4. Jump straight to a theme and apply it to all open windows:
    `kitten themes --reload-in=all <theme>`

## Manual (what i am doing)
1. Created a themes folder.
2. Download from repo or write a `.conf` file containing the colors
3. In `kitty.conf` include the correct file. Example: `include themes/nord.conf`
