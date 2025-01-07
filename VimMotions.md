# Neovim Shortcuts and Motions Guide

This guide provides an overview of essential shortcuts and motions in Neovim to improve your efficiency and fluency while editing.

---

## **Basic Navigation**

### **Cursor Movement**
- `h`: Move left
- `l`: Move right
- `j`: Move down
- `k`: Move up

### **Word and Line Navigation**
- `w`: Jump to the start of the next word
- `W`: Jump to the start of the next WORD (ignores punctuation)
- `e`: Jump to the end of the current/next word
- `E`: Jump to the end of the current/next WORD
- `b`: Jump to the start of the previous word
- `B`: Jump to the start of the previous WORD
- `0`: Jump to the beginning of the line
- `^`: Jump to the first non-blank character of the line
- `$`: Jump to the end of the line

### **Screen Navigation**
- `H`: Move to the top of the screen
- `M`: Move to the middle of the screen
- `L`: Move to the bottom of the screen
- `Ctrl-d`: Scroll half a screen down
- `Ctrl-u`: Scroll half a screen up
- `Ctrl-f`: Scroll a full screen down
- `Ctrl-b`: Scroll a full screen up

### **Paragraph and Section Navigation**
- `{`: Jump to the beginning of the current/previous paragraph
- `}`: Jump to the beginning of the next paragraph

---

## **Editing Commands**

### **Insert Mode**
- `i`: Enter insert mode before the cursor
- `I`: Enter insert mode at the beginning of the line
- `a`: Enter insert mode after the cursor
- `A`: Enter insert mode at the end of the line
- `o`: Insert a new line below and enter insert mode
- `O`: Insert a new line above and enter insert mode

### **Deleting Text**
- `x`: Delete the character under the cursor
- `X`: Delete the character before the cursor
- `d`: Delete from the current position (used with motions, e.g., `dw`, `d$`)
- `dd`: Delete the entire current line

### **Copy and Paste**
- `y`: Yank (copy) text (used with motions, e.g., `yw`, `y$`)
- `yy`: Yank the entire current line
- `p`: Paste after the cursor
- `P`: Paste before the cursor

### **Change Text**
- `c`: Change from the current position (used with motions, e.g., `cw`, `c$`)
- `cc`: Change the entire current line
- `C`: Change to the end of the line

---

## **Search and Replace**

### **Search**
- `/pattern`: Search forward for `pattern`
- `?pattern`: Search backward for `pattern`
- `n`: Repeat the last search forward
- `N`: Repeat the last search backward
- `*`: Search for the word under the cursor (forward)
- `#`: Search for the word under the cursor (backward)

### **Replace**
- `:%s/old/new/g`: Replace all occurrences of `old` with `new` in the file
- `:%s/old/new/gc`: Replace with confirmation

---

## **Visual Mode**
- `v`: Enter visual mode (character-wise selection)
- `V`: Enter visual line mode
- `Ctrl-v`: Enter visual block mode
- `o`: Jump to the other end of the selection
- `gv`: Re-select the last visual selection

---

## **Undo and Redo**
- `u`: Undo the last change
- `Ctrl-r`: Redo the undone change
- `U`: Undo all changes to the current line

---

## **Window Management**
- `:split` or `:sp`: Split the window horizontally
- `:vsplit` or `:vsp`: Split the window vertically
- `Ctrl-w w`: Switch between windows
- `Ctrl-w h`: Move to the window on the left
- `Ctrl-w l`: Move to the window on the right
- `Ctrl-w k`: Move to the window above
- `Ctrl-w j`: Move to the window below
- `Ctrl-w c`: Close the current window
- `Ctrl-w o`: Close all windows except the current one

---

## **Tabs**
- `:tabnew`: Open a new tab
- `gt`: Move to the next tab
- `gT`: Move to the previous tab
- `:tabs`: List all tabs
- `:tabclose`: Close the current tab

---

## **Registers**
- `"aY`: Yank into register `a`
- `"ap`: Paste from register `a`
- `"_d`: Delete into the black hole register (doesn't overwrite the default)

---

## **Marks**
- `m<letter>`: Set a mark with the specified letter
- `'<letter>`: Jump to the beginning of the line where the mark is set
- `` `<letter>` ``: Jump to the exact position of the mark

---

## **Command Mode**
- `:w`: Save the file
- `:q`: Quit Neovim
- `:wq`: Save and quit
- `:q!`: Quit without saving
- `:e <filename>`: Open a file
- `:vs <filename>`: Open a file in a vertical split

---

This guide covers essential shortcuts and motions to make your Neovim experience more efficient. Feel free to customize your Neovim key mappings further for improved productivity!


