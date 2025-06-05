# My Hyprland Dotfiles

These are my personal Hyprland dotfiles for Arch Linux, aiming for a clean, efficient, and aesthetically pleasing desktop experience. This setup features a highly customized Waybar, designed for both functionality and visual appeal, and integrates several key tools for a seamless workflow.

---

## Previews

Here are some screenshots showcasing the setup:

<!-- TODO: Add your screenshots here!
You can embed them like this:
![Screenshot 1 Description](path/to/your/screenshot1.png)
![Screenshot 2 Description](path/to/your/screenshot2.png)
Or link to a gallery:
[View more screenshots in the gallery!](link-to-your-gallery-or-imgur-album)
-->

---

## Inspiration and Credits

A significant portion of the Waybar configuration and styling in these dotfiles is directly inspired by and adapted from the excellent work of **Victor Dantas**.

Special thanks to:

*   **victordantasdev/waybar:** [https://github.com/victordantasdev/waybar](https://github.com/victordantasdev/waybar)
    *   *My Waybar setup extensively utilizes the structure, styling, and module configurations from Victor's repository, with minor personal modifications.*

---

## Features

*   **Hyprland Focus:** Optimized configurations for the Hyprland Wayland compositor.
*   **Highly Customized Waybar:**
    *   Sleek and functional design.
    *   Intuitive modules for essential system information (CPU, RAM, battery, network, volume, brightness).
    *   Integrated media controls.
    *   Workspace and window title displays.
*   **Effortless Management:** Seamless integration with common utilities for system management (e.g., brightness, volume, notifications).
*   **Themed Aesthetics:** Consistent theming across Hyprland and Waybar for a cohesive look.

---

## Prerequisites and Dependencies

Before attempting to use these dotfiles, ensure you have the following software and fonts installed on your Arch Linux system:

### Core Components

*   **Hyprland:** The Wayland compositor itself.
*   **Waybar:** The customizable Wayland bar.
*   **Git:** For cloning this repository.
*   **hyprlock** The customizable lockscreen

### Essential Utilities & Tools

*   **`rofi`**: Application launcher
*   **`swaync`**: Notification daemon.
*   **`hyprshot`**: Screenshot for hyprland
*   **`slurp`**: Selection utility for grim.
*   **`btop`**: Resource monitor (often used in terminal for quick checks).
*   **`gnome-keyring`**: Password management.
*   **`xdg-desktop-portal-hyprland`**: Required for screen sharing and other portal functionalities in Hyprland.
*   **`foot`** or **`alacritty`**: Your preferred terminal emulator. (Specify which one you primarily use!)

### Fonts & Icons

*   **Nerd Fonts:** Essential for many icons in Waybar and terminal applications (e.g., `ttf-nerd-fonts-symbols`). You might want to specify which particular Nerd Font you use (e.g., Hack Nerd Font, FiraCode Nerd Font).
*   **Any other specific fonts:** (e.g., a specific font for Waybar's text).

### Optional but Recommended

*   **`acpi`**: For more detailed battery information if `upower` isn't sufficient.
*   **`networkmanager`** / **`networkmanager-dmenu`**: For network management and a dmenu-style network selector.
*   **`pavucontrol`**: Graphical volume control.

**Installation Command Example (Arch Linux):**

```bash
sudo pacman -S hyprland waybar git wofi swaync grim slurp wl-clipboard playerctl pamixer brightnessctl btop nwg-look polkit-gnome gnome-keyring xdg-desktop-portal-hyprland foot # Add your specific terminal and fonts here
```
*(Remember to replace `foot` with your actual terminal if different, and specify your font packages.)*

---

## Installation Guide

Follow these steps to set up my Hyprland dotfiles on your system.

### 1. Backup Your Existing Dotfiles

It's crucial to back up your current configuration files before proceeding. This way, you can easily revert if something goes wrong or if you decide not to use these dotfiles.

```bash
mv ~/.config/hypr ~/.config/hypr_backup
mv ~/.config/waybar ~/.config/waybar_backup
```

### 2. Clone the Repository

Clone this repository to your preferred location (e.g., `~/dotfiles`).

```bash
git clone https://github.com/miikaTheCoder/hyprland.git ~/.config
```

### 3. Link the Dotfiles

Navigate into the cloned directory and create symbolic links to the appropriate configuration locations. This method allows you to easily update your dotfiles by simply pulling changes from the Git repository.

```bash
cd ~/.config
```

### 4. Post-Installation Steps

*   **Reboot/Relog:** After linking the files, it's usually best to log out and log back in, or even reboot your system, to ensure Hyprland and Waybar pick up the new configurations.
*   **Apply GTK Theme (Optional):** Use `nwg-look` to set your desired GTK theme and icon theme, as Hyprland respects these.
*   **Configure Waybar Permissions (if necessary):** Sometimes, certain Waybar modules might require permissions. Check your `config` and `style.css` for any specific instructions or consult the Waybar documentation.

---

## Customization

You can easily customize these dotfiles to fit your preferences:

*   **Waybar Theming:** Edit `~/.config/waybar/style.css` to change colors, fonts, sizes, and layout.
*   **Waybar Modules:** Adjust `~/.config/waybar/config` to enable/disable or modify modules, their order, and their display properties.
*   **Hyprland Keybindings:** Modify `~/.config/hypr/hyprland.conf` to change keybindings, monitor settings, and overall Hyprland behavior.
*   **Colors & Fonts:** Look for variables in the `config` files to quickly change color schemes and font families.

---

## Troubleshooting

*   **Waybar doesn't show up / Icons are missing:**
    *   Ensure all fonts, especially Nerd Fonts, are correctly installed and cached (`fc-cache -fv`).
    *   Check Waybar's log output in a terminal: `waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css` for errors.
    *   Verify all dependencies listed in the "Prerequisites" section are installed.
*   **Keybindings not working:**
    *   Confirm `~/.config/hypr/hyprland.conf` is correctly linked and that `hyprland` is sourcing it.
    *   Check for syntax errors in your `hyprland.conf`.
---

## Contact

If you have any questions or suggestions, feel free to open an issue on GitHub.
