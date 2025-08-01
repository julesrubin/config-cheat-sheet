# 🧰 Dev Environment Setup – WSL (Ubuntu) & macOS Equivalents

> For devs who want a **Mac-like Linux terminal** on Windows 11 using WSL2 + VS Code.

---

## 📦 TOOLS INSTALLED

| Tool                     | Purpose                                         | Installed via         | macOS Equivalent           |
|--------------------------|-------------------------------------------------|------------------------|----------------------------|
| **WSL2 + Ubuntu**        | Linux environment on Windows                   | Windows feature        | Native macOS terminal      |
| **Windows Terminal**     | Modern terminal app                            | Microsoft Store        | iTerm2                     |
| **Oh My Zsh**            | Zsh configuration framework                    | Git clone              | Same                       |
| **Powerlevel10k**        | Zsh theme with icons and layout                | Git clone              | Same                       |
| **Homebrew (Linuxbrew)**| Universal package manager                      | `/bin/bash` install    | Homebrew                   |
| **Python 3.13**          | Latest Python interpreter                      | Homebrew               | Homebrew                   |
| **Git**                  | Version control                                | Already in WSL         | Xcode CLI tools            |
| **VS Code (Remote WSL)**| Code editor with Linux integration             | Windows + Extension    | VS Code native             |
| **Google Cloud CLI**     | gcloud commands                                | APT repo (not Brew)    | Homebrew or manual         |
| **zsh-autosuggestions**  | History-based suggestions in zsh               | Git clone              | Same                       |
| **zsh-syntax-highlighting** | Color commands while typing               | Git clone              | Same                       |
| **fzf**                  | Fuzzy finder for Ctrl+R, search, etc.          | Homebrew               | Homebrew                   |
| **zoxide**               | Smarter, faster `cd` command                   | Homebrew               | Homebrew                   |

---

## 🛠 INSTALL STEPS SUMMARY (Linux/WSL version)

### 1. Configure Terminal
```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# In ~/.zshrc:
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### 2. Homebrew (Linuxbrew)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### 3. Python 3.13
```bash
brew install python@3.13
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.13/bin:$PATH"' >> ~/.zshrc
```

Optionnally, you can add an alias for Python 3.13 if the default `python` command points to Python 2.x:
```bash
echo 'alias python=python3' >> ~/.zshrc
echo 'alias pip=pip3' >> ~/.zshrc
```

### 4. Google Cloud CLI
```bash
# Add GCP repo and key
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
  | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list > /dev/null

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

sudo apt update && sudo apt install google-cloud-sdk

# Initialize gcloud
gcloud init
```

### 5. Install VS Code Remote WSL Extension
- Install [VS Code](https://code.visualstudio.com/).
- Install the Remote - WSL extension

### 6. GitHub SSH Access
```bash
ssh-keygen -t ed25519 -C "your@email.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy key to clipboard
cat ~/.ssh/id_ed25519.pub

# Paste into GitHub → Settings → SSH keys
```

### 7. Additional Zsh Plugins
```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# In ~/.zshrc:
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

### 8. Install fzf and zoxide
```bash
brew install fzf
$(brew --prefix)/opt/fzf/install  # Enable key bindings & completion

brew install zoxide
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
```

---

## 🧠 TIPS & SHORTCUTS

| Action                      | Shortcut / Command           |
|-----------------------------|------------------------------|
| Open VS Code in WSL         | `code .`                     |
| Fuzzy history search        | <kbd>Ctrl</kbd>+<kbd>R</kbd> (after fzf install) |
| Jump to a recent directory  | `z <dir>` (zoxide)           |
| Git autocomplete            | `git checkout <tab>`         |
| Accept history suggestion   | <kbd>→</kbd> (right arrow key) |

---

## 📁 Recommended Folder Structure (WSL)

```text
~/dev/              # Your code projects live here
~/.zshrc            # Shell config
~/.oh-my-zsh/       # Oh My Zsh framework
~/.ssh/             # SSH keys
```