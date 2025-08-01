# Script to initialize a GitHub repo and push it using SSH
# Usage: ./create-gh-repo.sh <repo-name>

set -e

# --- Check argument ---
if [ -z "$1" ]; then
  echo "❌ Error: You must provide a repository name."
  echo "Usage: ./create-gh-repo.sh <repo-name>"
  exit 1
fi

REPO_NAME="$1"

# --- Check if current folder is empty ---
if [ -z "$(ls -A .)" ]; then
  echo "📄 Creating README.md with repo title..."
  echo "# $REPO_NAME" > README.md
else
  echo "⚠️ Folder is not empty — skipping README creation."
fi

# --- Init git and commit ---
echo "🔧 Initializing git repository..."
git init
git branch -M main

echo "➕ Adding files..."
git add .
git commit -m "Initial commit"

# --- Create repo on GitHub via GitHub CLI ---
echo "🌐 Creating GitHub repo for 'julesrubin/$REPO_NAME'..."
gh repo create "julesrubin/$REPO_NAME" --public --source=. --remote=origin --push

# --- Done ---
echo "✅ Repo '$REPO_NAME' successfully created and pushed!"
echo "You can now view it at:"
echo "https://github.com/julesrubin/$REPO_NAME"
echo "Happy coding! 🎉"