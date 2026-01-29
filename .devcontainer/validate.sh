#!/bin/bash
# Validation script for AI Interview Workshop Codespace
# This runs automatically when the Codespace starts

echo ""
echo "🔍 Validating your environment..."
echo ""

# Track failures
FAILED=0

# Check Python
if command -v python &> /dev/null; then
    PYTHON_VERSION=$(python --version 2>&1)
    echo "✅ $PYTHON_VERSION"
else
    echo "❌ Python not found"
    FAILED=1
fi

# Check Node
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version 2>&1)
    echo "✅ Node.js $NODE_VERSION"
else
    echo "❌ Node.js not found"
    FAILED=1
fi

# Check PowerShell
if command -v pwsh &> /dev/null; then
    PWSH_VERSION=$(pwsh --version 2>&1)
    echo "✅ $PWSH_VERSION"
else
    echo "❌ PowerShell not found"
    FAILED=1
fi

# Check GitHub CLI
if command -v gh &> /dev/null; then
    GH_VERSION=$(gh --version 2>&1 | head -n 1)
    echo "✅ $GH_VERSION"
else
    echo "❌ GitHub CLI not found"
    FAILED=1
fi

# Check GitHub Copilot CLI
if command -v copilot &> /dev/null; then
    echo "✅ GitHub Copilot CLI installed"
else
    echo "⚠️  GitHub Copilot CLI not found. Install with: npm install -g @github/copilot"
fi

echo ""
if [ $FAILED -eq 0 ]; then
    echo "🎉 All tools are ready! Open a question folder to get started."
else
    echo "⚠️  Some tools are missing. Check the errors above."
fi
echo ""
