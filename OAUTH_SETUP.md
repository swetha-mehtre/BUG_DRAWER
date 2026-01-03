# 🔐 OAuth Authentication Setup Guide

## Overview

Your Bug Tracker now supports OAuth 2.0 authentication with **Google** and **GitHub**. Users can sign in using their existing social accounts for a seamless experience.

---

## 🔧 Configuration

### Environment Variables

Add these to your `.env` file or set them in your system environment:

```bash
# Google OAuth
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
GOOGLE_REDIRECT_URI=http://localhost:5000/auth/google/callback

# GitHub OAuth
GITHUB_CLIENT_ID=your_github_client_id
GITHUB_CLIENT_SECRET=your_github_client_secret
GITHUB_REDIRECT_URI=http://localhost:5000/auth/github/callback
```

---

## 📝 Setting Up Google OAuth

### Step 1: Create Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project
3. Enable the "Google+ API"

### Step 2: Create OAuth 2.0 Credentials

1. Go to **Credentials** → **Create Credentials** → **OAuth 2.0 Client ID**
2. Choose **Web application**
3. Add authorized redirect URIs:
   - `http://localhost:5000/auth/google/callback` (development)
   - `https://yourdomain.com/auth/google/callback` (production)
4. Copy your **Client ID** and **Client Secret**

### Step 3: Set Environment Variables

```bash
export GOOGLE_CLIENT_ID="your_client_id_here"
export GOOGLE_CLIENT_SECRET="your_client_secret_here"
export GOOGLE_REDIRECT_URI="http://localhost:5000/auth/google/callback"
```

---

## 🐙 Setting Up GitHub OAuth

### Step 1: Register OAuth Application

1. Go to GitHub Settings → [Developer Settings](https://github.com/settings/developers)
2. Click **New OAuth App**
3. Fill in the form:
   - **Application name**: Bug Tracker
   - **Homepage URL**: `http://localhost:5000` (or your domain)
   - **Authorization callback URL**: `http://localhost:5000/auth/github/callback`
4. Copy your **Client ID** and generate **Client Secret**

### Step 2: Set Environment Variables

```bash
export GITHUB_CLIENT_ID="your_client_id_here"
export GITHUB_CLIENT_SECRET="your_client_secret_here"
export GITHUB_REDIRECT_URI="http://localhost:5000/auth/github/callback"
```

---

## 🚀 How It Works

### Login Flow

1. User clicks "Sign in with Google/GitHub" button
2. Redirects to provider's login page
3. User grants permission
4. Redirects back with authorization code
5. System exchanges code for access token
6. Retrieves user info (email, name, etc.)
7. Creates account or logs in existing user
8. Sets session and redirects to dashboard

### Database Fields

Added to `users` table:

- `oauth_provider` - 'google' or 'github'
- `oauth_id` - Provider's unique user ID
- `oauth_token` - JSON token data for future API calls

---

## 🛡️ Security Features

✅ **State Parameter**: Prevents CSRF attacks
✅ **Secure Redirect**: Only whitelisted URLs allowed
✅ **Token Storage**: OAuth tokens stored in database
✅ **Email Verification**: Checks primary email from provider
✅ **Account Linking**: Maps OAuth users to existing accounts

---

## 🧪 Testing

### Local Development

```bash
# Windows PowerShell
$env:GOOGLE_CLIENT_ID = "your_id"
$env:GOOGLE_CLIENT_SECRET = "your_secret"
$env:GITHUB_CLIENT_ID = "your_id"
$env:GITHUB_CLIENT_SECRET = "your_secret"

# Then start the app
python app.py
```

### Test Flow

1. Navigate to http://localhost:5000/login
2. Click "Sign in with Google" or "Sign in with GitHub"
3. Complete the OAuth flow
4. Should redirect to dashboard after successful login

---

## 🐛 Troubleshooting

### "OAuth is not configured" message

- Check that Client ID and Secret are set as environment variables
- Restart the Flask app after setting variables

### "Invalid redirect URI" error

- Verify redirect URI matches exactly in provider settings
- Include protocol (http/https) and full path

### User profile missing data

- Ensure scopes include 'email' and 'profile'
- Some providers limit data sharing based on user privacy settings

### Account not linking

- Different emails between OAuth and app account prevent linking
- Create new account or use same email

---

## 📦 Dependencies

```bash
pip install google-auth-oauthlib requests-oauthlib
```

---

## 🔄 Production Deployment

### Important Changes

1. Set `FLASK_ENV=production`
2. Use HTTPS redirect URIs (required)
3. Store secrets in secure vault (not .env file)
4. Enable `SESSION_COOKIE_SECURE = True` (HTTPS only)
5. Use strong `SECRET_KEY`

### Example Production Config

```python
GOOGLE_REDIRECT_URI = "https://yourdomain.com/auth/google/callback"
GITHUB_REDIRECT_URI = "https://yourdomain.com/auth/github/callback"
SESSION_COOKIE_SECURE = True
SESSION_COOKIE_HTTPONLY = True
```

---

## 📱 Features

✨ **One-Click Login** - Sign in with one click
✨ **Account Linking** - Maps OAuth to existing email accounts
✨ **Profile Auto-Fill** - Name and email automatically populated
✨ **Multiple Providers** - Use Google OR GitHub
✨ **Session Management** - Automatic logout on session expiry

---

## 🎯 Next Steps

1. Configure Google and GitHub OAuth apps
2. Set environment variables
3. Test the login flow
4. Deploy to production with HTTPS
5. Monitor logs for authentication errors

For issues or questions, check the Flask logs at `bug_tracker.log`.
