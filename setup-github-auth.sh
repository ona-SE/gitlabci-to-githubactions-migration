#!/bin/bash
set -e

echo "GitHub Authentication Setup"
echo "============================"
echo ""
echo "The ONA_GITHUB token is invalid or expired."
echo ""
echo "To create a new GitHub Personal Access Token:"
echo "1. Go to: https://github.com/settings/tokens/new"
echo "2. Set a note like: 'Gitpod GitLab CI Migration'"
echo "3. Select scopes:"
echo "   - repo (all)"
echo "   - workflow"
echo "   - admin:org (read:org)"
echo "4. Click 'Generate token'"
echo "5. Copy the token"
echo ""
echo "Then run this command to set it:"
echo "  gp env ONA_GITHUB=your_token_here"
echo ""
echo "After setting the token, restart the workspace or run:"
echo "  export ONA_GITHUB=your_token_here"
echo "  echo \$ONA_GITHUB | gh auth login --with-token"
echo ""

# Check if a token is provided as argument
if [ -n "$1" ]; then
    echo "Testing provided token..."
    if curl -s -H "Authorization: token $1" https://api.github.com/user | grep -q '"login"'; then
        echo "✅ Token is valid!"
        export GITHUB_TOKEN="$1"
        export ONA_GITHUB="$1"
        echo "$1" | gh auth login --with-token
        echo ""
        echo "Token configured successfully!"
        echo "To persist this token across workspace restarts, run:"
        echo "  gp env ONA_GITHUB=$1"
    else
        echo "❌ Token is invalid. Please check and try again."
        exit 1
    fi
else
    echo "Usage: ./setup-github-auth.sh <your_github_token>"
    echo "Or follow the instructions above to set it manually."
fi
