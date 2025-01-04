# tmux Guide

This README serves as a comprehensive guide for using and customizing **tmux**, a terminal multiplexer that allows you to manage multiple terminal sessions efficiently.

---

## Installation

### **Ubuntu/Debian**
```bash
sudo apt update
sudo apt install tmux
```

### **macOS**
```bash
brew install tmux
```

---

## Key Concepts

- **Session**: A collection of windows and panes.
- **Window**: Like a tab, containing one or more panes.
- **Pane**: A split section of the terminal within a window.

---

## Basic Commands

### **Starting and Exiting**
- Start a new session:
  ```bash
  tmux
  ```
- Attach to a detached session:
  ```bash
  tmux attach
  ```
- List sessions:
  ```bash
  tmux list-sessions
  ```
- Detach from a session (inside tmux):
  Press `Ctrl+s`, then `d`.

### **Windows**
- Create a new window:
  Press `Ctrl+s`, then `c`.
- Switch between windows:
  Press `Ctrl+s`, then a number (`0-9`).
- Rename a window:
  Press `Ctrl+s`, then `,` (comma). Type the new name and press **Enter**.
- Close a window:
  Press `Ctrl+s`, then `&`. Confirm by pressing `y`.

### **Panes**
- Split vertically:
  Press `Ctrl+s`, then `%`.
- Split horizontally:
  Press `Ctrl+s`, then `"` (double quote).
- Navigate between panes:
  Press `Ctrl+s`, then use the arrow keys.
- Close a pane:
  Press `Ctrl+s`, then `x`. Confirm by pressing `y`.

### **Sessions**
- Rename a session:
  Press `Ctrl+s`, then `:` and type:
  ```bash
  rename-session <new_name>
  ```
- Kill a session:
  ```bash
  tmux kill-session -t <session_name>
  ```

---

## Customization

### **Configuration File**
Create or edit `~/.tmux.conf`:
```bash
nano ~/.tmux.conf
```

### **Example Configurations**
Add the following for basic enhancements:
```bash
# Set the status bar at the bottom
set -g status-position bottom

# Set status bar style
set -g status on
set -g status-interval 5
set -g status-bg black
set -g status-fg white

# Left side of the status bar
set -g status-left-length 40
set -g status-left "#[bg=blue,fg=white,bold] #(whoami) #[bg=black,fg=white] | #[bg=green,fg=black,bold] #(hostname -s) #[default]"

# Right side of the status bar
set -g status-right-length 120
set -g status-right "#[bg=black,fg=green,bold] %Y-%m-%d #[bg=black,fg=yellow,bold] %H:%M #[bg=black,fg=cyan,bold] #(uptime | awk '{print $3 $4}' | sed 's/,//') #[default]"

# Window status style
setw -g window-status-format " #I: #W "
setw -g window-status-current-format "#[bg=yellow,fg=black,bold] #I: #W #[default]"
setw -g window-status-separator " | "

# Pane border styling
set -g pane-border-style fg=white
set -g pane-active-border-style fg=cyan

# Message styling
set -g message-style bg=black,fg=white

# Command prompt styling
set -g message-command-style bg=blue,fg=white

# Customize the mode (e.g., copy mode)
setw -g mode-style bg=black,fg=yellow,bold

# Enable UTF-8 symbols for better visuals
set -g utf8 on
set -g status-utf8 on

# Enable mouse support (optional)
set -g mouse on
```

Apply changes immediately:
```bash
tmux source-file ~/.tmux.conf
```

---

## Advanced Tips

### **Persistent Sessions**
- Use [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) to save and restore sessions.
- Installation:
  ```bash
  git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
  ```
  Add the following to `~/.tmux.conf`:
  ```bash
  run-shell ~/.tmux/plugins/tmux-resurrect/resurrect.tmux
  ```
- Save a session:
  Press `Ctrl+s`, then `Ctrl+s`.
- Restore a session:
  Press `Ctrl+s`, then `Ctrl+r`.

### **Scripting tmux**
Automate session and window creation with scripts:
```bash
#!/bin/bash
tmux new-session -d -s my_session -n editor
# Create a new window
 tmux new-window -t my_session:1 -n logs
# Split panes
 tmux split-window -h
 tmux select-pane -t 0
# Attach to the session
tmux attach -t my_session
```
Make the script executable:
```bash
chmod +x setup_tmux.sh
```
Run the script:
```bash
./setup_tmux.sh
```

---

## Summary of Key Bindings

| Key Binding       | Action                        |
|-------------------|-------------------------------|
| `Ctrl+s c`        | Create a new window           |
| `Ctrl+s ,`        | Rename the current window     |
| `Ctrl+s x`        | Close the current pane        |
| `Ctrl+s %`        | Split pane vertically         |
| `Ctrl+s "`        | Split pane horizontally       |
| `Ctrl+s d`        | Detach from the session       |
| `Ctrl+s &`        | Kill the current window       |
| `Ctrl+s [Arrow]`  | Move between panes            |

---

## Resources
- [Official tmux Documentation](https://man7.org/linux/man-pages/man1/tmux.1.html)
- [tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [tmux Plugins](https://github.com/tmux-plugins)

---

Happy multiplexing!


