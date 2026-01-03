#!/bin/bash
# Quick Setup Script for OAuth

echo "🔐 Setting up OAuth Authentication..."
echo ""
echo "=== Google OAuth Setup ==="
echo "1. Go to: https://console.cloud.google.com/"
echo "2. Create new project"
echo "3. Enable Google+ API"
echo "4. Create OAuth 2.0 Web Application credentials"
echo "5. Add redirect URI: http://localhost:5000/auth/google/callback"
echo ""

echo "=== GitHub OAuth Setup ==="
echo "1. Go to: https://github.com/settings/developers"
echo "2. Click 'New OAuth App'"
echo "3. Fill in details with callback: http://localhost:5000/auth/github/callback"
echo ""

echo "=== Environment Variables ==="
echo "Add these to your .env file or system environment:"
echo ""
echo "GOOGLE_CLIENT_ID=your_google_client_id"
echo "GOOGLE_CLIENT_SECRET=your_google_client_secret"
echo "GOOGLE_REDIRECT_URI=http://localhost:5000/auth/google/callback"
echo ""
echo "GITHUB_CLIENT_ID=your_github_client_id"
echo "GITHUB_CLIENT_SECRET=your_github_client_secret"
echo "GITHUB_REDIRECT_URI=http://localhost:5000/auth/github/callback"
echo ""

echo "✅ Setup Complete! Start the app with: python app.py"
