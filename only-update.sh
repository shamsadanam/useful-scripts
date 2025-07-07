#!/bin/bash

pkg="$1"

if [ -z "$pkg" ]; then
  echo "❌ Error: No package name provided."
  echo "Usage: $0 <package-name>"
  exit 1
fi

echo "🔍 Checking for updates..."
sudo apt update

if apt list --upgradable 2>/dev/null | grep -q "^$pkg/"; then
  echo "⬆️ Updating $pkg..."
  sudo apt install --only-upgrade "$pkg" -y
  echo "✅ $pkg has been updated."
else
  echo "✅ $pkg is already up to date."
fi
