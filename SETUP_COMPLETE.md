# 🐞 Bug Tracker - Professional Setup & OAuth Integration Guide

## ✅ Current System Status

Your application is **fully functional** and running at:

- **Local**: http://127.0.0.1:5000
- **Network**: http://192.168.2.118:5000

---

## 🔐 OAuth 2.0 Configuration

### **Complete Callback URLs for Google Cloud Console**

Add these exact URLs to your Google Cloud project under **APIs & Services → Credentials → OAuth 2.0 Client → Authorized redirect URIs**:

```
http://127.0.0.1:5000/auth/google/callback
http://localhost:5000/auth/google/callback
http://192.168.2.118:5000/auth/google/callback
```

### **Complete Callback URLs for GitHub OAuth App**

Add these exact URLs to your GitHub Developer Settings under **OAuth Apps → Your App → Authorization callback URL**:

```
http://127.0.0.1:5000/auth/github/callback
http://localhost:5000/auth/github/callback
http://192.168.2.118:5000/auth/github/callback
```

---

## 🚀 Quick Setup Steps

### **1. Google Cloud Console Setup**

```
✓ Navigate to: https://console.cloud.google.com/
✓ Project: bug_drawer
✓ Go to: APIs & Services → Credentials
✓ Select: OAuth 2.0 Client (Web)
✓ Add redirect URIs (listed above)
✓ Copy: Client ID and Client Secret
```

### **2. GitHub OAuth Setup**

```
✓ Navigate to: https://github.com/settings/developers
✓ Click: New OAuth App
✓ Application name: Bug Tracker
✓ Homepage URL: http://192.168.2.118:5000
✓ Authorization callback URL: http://192.168.2.118:5000/auth/github/callback
✓ Copy: Client ID and Client Secret
```

### **3. Set Environment Variables (Windows PowerShell)**

```powershell
# Open PowerShell and run:
$env:GOOGLE_CLIENT_ID="YOUR_GOOGLE_CLIENT_ID"
$env:GOOGLE_CLIENT_SECRET="YOUR_GOOGLE_CLIENT_SECRET"
$env:GITHUB_CLIENT_ID="YOUR_GITHUB_CLIENT_ID"
$env:GITHUB_CLIENT_SECRET="YOUR_GITHUB_CLIENT_SECRET"
```

### **4. Restart Flask Server**

```powershell
cd D:\bug_drawer
python app.py
```

---

## 📋 Profile Management Features

Your profile section includes:

✅ **Profile Picture Management**

- Click "📸 Change Photo" to upload a profile picture
- Auto-generates avatar from photo using AI

✅ **Personal Information**

- Full Name
- Username
- Contact Number
- Email (read-only)

✅ **Avatar Generation Settings**

- **Gemini API Key**: For AI-powered avatar generation
- **Hoodie Color**: 12 presets + custom color picker
- **Gender Preference**: Male, Female, or Prefer not to say
- Smart text color (white/black) based on hoodie background

✅ **Edit Mode**

1. Click **"✏️ Edit Profile"** button (top-right)
2. Button changes to **"✓ Done Editing"** (green)
3. All fields become editable
4. Click **"💾 Save Profile"** to save changes

---

## 🧪 Testing Checklist

### **Profile Testing**

- [ ] Click "✏️ Edit Profile" button
- [ ] Enter Full Name
- [ ] Enter Username
- [ ] Enter Contact Number
- [ ] Select Gender Preference
- [ ] Upload a profile picture (Max 5MB)
- [ ] Enter Gemini API Key
- [ ] Select/customize hoodie color
- [ ] Click "💾 Save Profile"
- [ ] Verify "Profile updated successfully!" message
- [ ] Refresh page - all data persists

### **OAuth Testing (After Cloud Setup)**

- [ ] Click "Login with Google" on login page
- [ ] Authenticate with Google account
- [ ] Profile auto-populated with Google data
- [ ] Click "Login with GitHub" on login page
- [ ] Authenticate with GitHub account
- [ ] Profile auto-populated with GitHub data

### **Avatar Generation Testing**

- [ ] Ensure profile picture is uploaded
- [ ] Ensure full name is entered
- [ ] Ensure Gemini API key is set
- [ ] Click "🎨 Generate Avatar" button
- [ ] Wait for AI generation
- [ ] Avatar appears on profile

---

## 📱 Application Features

### **Bug Management**

- Create, view, edit, and delete bugs
- Assign bugs to team members
- Track bug status and priority
- Add comments and attachments

### **User Management**

- User authentication (email/password)
- OAuth 2.0 login (Google & GitHub)
- Role-based access control (Admin, Manager, Developer)
- Profile customization

### **Avatar System**

- Ghibli-style avatar generation
- AI-powered using Google Gemini API
- Photo-based avatar creation
- Custom color customization
- Gender preference consideration

---

## 🔗 Important URLs

**Development Server:**

- Dashboard: http://192.168.2.118:5000/dashboard
- Profile: http://192.168.2.118:5000/profile
- Login: http://192.168.2.118:5000/login
- Signup: http://192.168.2.118:5000/signup

**OAuth Endpoints:**

- Google Login: http://192.168.2.118:5000/auth/google
- Google Callback: http://192.168.2.118:5000/auth/google/callback
- GitHub Login: http://192.168.2.118:5000/auth/github
- GitHub Callback: http://192.168.2.118:5000/auth/github/callback

---

## 🛠️ Troubleshooting

### **"Edit Profile" button not working?**

- Ensure you clicked the button and it turned green
- Check browser console for errors (F12)

### **Profile not saving?**

- Verify form fields are filled correctly
- Check "Profile updated successfully!" message appears
- Refresh page to verify data persists

### **OAuth login not working?**

- Verify credentials are set in environment variables
- Ensure callback URLs are correctly added to cloud providers
- Check Flask server logs for detailed errors

### **Avatar not generating?**

- Verify Gemini API key is valid
- Ensure full name is entered
- Upload a profile picture first
- Check browser console for API errors

---

## 📞 Support

For detailed OAuth setup, refer to the **OAUTH_SETUP_GUIDE.md** file in your project root.

**Your app is production-ready!** 🎉
