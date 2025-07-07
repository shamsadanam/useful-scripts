#CHAT-GPT

echo "Checking for updates..."
sudo apt update

if apt list --upgradable | grep -q code; then
  echo "Updating VS Code..."
  sudo apt install --only-upgrade code -y
  echo "VS Code has been updated."
else
  echo "VS Code is already up to date."
fi
