# 🧪 Create & Push a GitHub Repo via CLI (SSH)

This guide explains how to initialize a Git repository locally and push it to GitHub using only command-line tools and SSH authentication.

## ✅ Prerequisites

- [x] A GitHub account
- [x] Git installed (`brew install git` on Linux/macOS)
- [x] SSH key added to your GitHub account (see below)

---

## 🔐 Set up your SSH key (only once)

```bash
# Check if you already have an SSH key
ls ~/.ssh/id_ed25519.pub

# If not, generate one
ssh-keygen -t ed25519 -C "your.email@example.com"

# Add your key to the SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy the key and add it to GitHub: https://github.com/settings/ssh/new
cat ~/.ssh/id_ed25519.pub
```

## 🚀 Steps to Create & Push a New Repo

```bash
# 1. Create a local project directory
mkdir my-new-repo && cd my-new-repo

# 2. (Optional) Create a README or other files
touch README.md
code .  # Or open with your preferred editor

# 3. Initialize Git
git init
git branch -M main  # Rename default branch to 'main'

# 4. Commit your files
git add .
git commit -m "Initial commit"

# 5. Create a new repo on GitHub (manually or with GitHub CLI)
# GitHub CLI (optional)
gh repo create julesrubin/my-new-repo --public --source=. --remote=origin --push

# Or manually: create the repo at https://github.com/new

# 6. Add remote
git remote add origin git@github.com:julesrubin/my-new-repo.git

# 7. Push your local repo to GitHub
git push -u origin main
```

### 🧠 Notes

- You can use `git push -u origin master` if your local branch is named `master` instead of `main`.
- Add a `.gitignore` before pushing to exclude unwanted files (e.g., `.DS_Store`, `node_modules`, etc).
- Set your global Git identity once if not already set:
    ```bash
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
    ```

### 🛠 Optional: Set `main` as your default for all new repos

```bash
git config --global init.defaultBranch main
```