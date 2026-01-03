# OAuth 2.0 Setup Guide for Bug Tracker Application

## 🔐 Your Application OAuth Callback URLs

### **Google OAuth Callback URLs**

Add ALL of these to your Google Cloud Console under "Authorized redirect URIs":

```
http://127.0.0.1:5000/auth/google/callback
http://localhost:5000/auth/google/callback
http://192.168.2.118:5000/auth/google/callback
```

### **GitHub OAuth Callback URL**

Add this to your GitHub OAuth App settings under "Authorization callback URL":

```
http://192.168.2.118:5000/auth/github/callback
http://127.0.0.1:5000/auth/github/callback
http://localhost:5000/auth/github/callback
```

---

## 📋 Step-by-Step Setup Instructions

### **Step 1: Google Cloud Console Setup**

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your "bug_drawer" project
3. Navigate to **APIs & Services** > **Credentials**
4. Click on your OAuth 2.0 Client ID (Web application)
5. Under **Authorized redirect URIs**, add:
   ```
   http://127.0.0.1:5000/auth/google/callback
   http://localhost:5000/auth/google/callback
   http://192.168.2.118:5000/auth/google/callback
   ```
6. Click **Save**
7. Copy your **Client ID** and **Client Secret**

### **Step 2: Set Environment Variables (PowerShell)**

```powershell
$env:GOOGLE_CLIENT_ID="your_client_id_here"
$env:GOOGLE_CLIENT_SECRET="your_client_secret_here"
$env:GITHUB_CLIENT_ID="your_github_client_id_here"
$env:GITHUB_CLIENT_SECRET="your_github_client_secret_here"
```

### **Step 3: GitHub OAuth App Setup** (Optional)

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **New OAuth App**
3. Fill in the form:
   - **Application name**: Bug Tracker
   - **Homepage URL**: http://192.168.2.118:5000
   - **Authorization callback URL**:
     ```
     http://192.168.2.118:5000/auth/github/callback
     ```
4. Click **Create OAuth App**
5. Copy your **Client ID** and **Client Secret**

### **Step 4: Restart Your Flask Server**

```powershell
# Stop current server (Ctrl+C)
# Set environment variables (from Step 2)
# Restart server
python app.py
```

---

## 🧪 Testing OAuth

1. Navigate to **http://192.168.2.118:5000** (or http://127.0.0.1:5000)
2. Click **"Login with Google"** or **"Login with GitHub"**
3. You should be redirected to Google/GitHub login
4. After authentication, you'll be redirected back to the app
5. Profile will auto-populate with OAuth data

---

## 📝 Production URLs (When Deploying)

When you deploy to production, add these URLs to your OAuth providers:

```
https://yourdomain.com/auth/google/callback
https://yourdomain.com/auth/github/callback
```

---

## ✅ Verification Checklist

- [ ] Added Google callback URLs to Google Cloud Console
- [ ] Added GitHub callback URLs to GitHub OAuth App
- [ ] Set environment variables (GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET, etc.)
- [ ] Restarted Flask server
- [ ] Tested Google OAuth login
- [ ] Tested GitHub OAuth login
- [ ] Profile information auto-populated from OAuth
- [ ] Can edit profile after login
