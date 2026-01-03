# 🐞 Bug Tracker - Professional Bug Tracking System

A modern, full-featured bug tracking and project management system built with Flask, featuring OAuth authentication, AI-powered avatar generation, and a beautiful dark/light theme interface.

![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)
![Flask](https://img.shields.io/badge/Flask-3.0.0-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

### 🔐 Authentication & Authorization

- **Email/Password Authentication** - Secure user registration and login
- **OAuth 2.0 Integration** - Sign in with Google or GitHub
- **Role-Based Access Control** - Admin, Manager, and Developer roles
- **Session Management** - Secure session handling with Flask

### 🐛 Bug Management

- **Full CRUD Operations** - Create, Read, Update, Delete bugs
- **Bug Assignment** - Assign bugs to team members
- **Priority Levels** - Low, Medium, High, Critical
- **Status Tracking** - Open, In Progress, Resolved, Closed
- **File Attachments** - Upload screenshots and files (up to 5MB)
- **Bug Comments** - Threaded discussion on each bug
- **Search & Filter** - Find bugs quickly by status, priority, or assignee

### 👤 User Profiles

- **Customizable Profiles** - Full name, username, contact number
- **Profile Pictures** - Upload and manage profile photos
- **User Statistics** - Track bugs created, assigned, and comments
- **AI Avatar Generation** - Create Ghibli-style avatars using Google Gemini API

### 🎨 AI-Powered Features

- **Ghibli Avatar Generator** - Generate custom anime-style avatars
- **Photo-Based Generation** - AI creates avatars based on your photo
- **Customizable Colors** - 12 preset colors + custom color picker
- **Smart Text Colors** - Automatic text contrast on avatars
- **Gender Preferences** - Personalized avatar generation

### 🎯 User Experience

- **Dark/Light Theme** - Toggle between themes with persistent settings
- **Responsive Design** - Works on desktop, tablet, and mobile
- **Real-time Updates** - Dynamic UI updates without page reload
- **User-Friendly Interface** - Clean, modern design
- **Error Handling** - Comprehensive validation and error messages

## 🚀 Quick Start

### Prerequisites

- Python 3.10 or higher
- pip package manager
- Git

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/swetha-mehtre/BUG_DRAWER.git
cd BUG_DRAWER
```

2. **Create virtual environment**

```bash
python -m venv .venv
```

3. **Activate virtual environment**

```bash
# Windows
.venv\Scripts\activate

# Linux/Mac
source .venv/bin/activate
```

4. **Install dependencies**

```bash
pip install -r requirements.txt
```

5. **Run the application**

```bash
python app.py
```

6. **Access the application**
   Open your browser and navigate to:

- http://127.0.0.1:5000
- http://localhost:5000

## 🔧 Configuration

### OAuth Setup (Optional)

#### Google OAuth

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing
3. Navigate to **APIs & Services → Credentials**
4. Create **OAuth 2.0 Client ID** (Web application)
5. Add authorized redirect URIs:
   - `http://127.0.0.1:5000/auth/google/callback`
   - `http://localhost:5000/auth/google/callback`
6. Copy Client ID and Client Secret
7. Set environment variables:

```bash
# Windows PowerShell
$env:GOOGLE_CLIENT_ID="your_client_id"
$env:GOOGLE_CLIENT_SECRET="your_client_secret"

# Linux/Mac
export GOOGLE_CLIENT_ID="your_client_id"
export GOOGLE_CLIENT_SECRET="your_client_secret"
```

#### GitHub OAuth

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **New OAuth App**
3. Fill in the details:
   - Application name: Bug Tracker
   - Homepage URL: `http://localhost:5000`
   - Authorization callback URL: `http://localhost:5000/auth/github/callback`
4. Copy Client ID and Client Secret
5. Set environment variables:

```bash
# Windows PowerShell
$env:GITHUB_CLIENT_ID="your_client_id"
$env:GITHUB_CLIENT_SECRET="your_client_secret"

# Linux/Mac
export GITHUB_CLIENT_ID="your_client_id"
export GITHUB_CLIENT_SECRET="your_client_secret"
```

### Gemini API Setup (For Avatar Generation)

1. Go to [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Sign in with your Google account
3. Click **Create API Key**
4. Copy the API key
5. Add it to your profile in the application

## 📁 Project Structure

```
bug_drawer/
├── app.py                  # Main Flask application
├── requirements.txt        # Python dependencies
├── bug_tracker.db         # SQLite database
├── static/
│   └── css/
│       ├── style.css      # Main stylesheet
│       ├── light-theme-enhanced.css
│       ├── dark-theme-enhanced.css
│       └── enhancements.css
├── templates/
│   ├── login.html         # Login page
│   ├── signup.html        # Registration page
│   ├── dashboard.html     # Main dashboard
│   ├── profile.html       # User profile
│   ├── new_bug.html       # Create bug
│   └── view_bug.html      # Bug details
└── uploads/               # User uploaded files
```

## 🗄️ Database Schema

### Users Table

- id, email, password (hashed), role
- full_name, username, contact_number
- profile_picture, gemini_api_key
- hoodie_color, gender
- oauth_provider, oauth_id, oauth_token
- created_at

### Bugs Table

- id, title, description, priority, status
- created_by, assigned_to
- attachment, attachment_filename
- created_at, updated_at

### Comments Table

- id, bug_id, user_id
- comment_text, created_at

## 🎨 Features in Detail

### Bug Priority Levels

- 🔴 **Critical** - System crash, data loss
- 🟠 **High** - Major functionality broken
- 🟡 **Medium** - Important but not critical
- 🟢 **Low** - Minor issues, enhancements

### Bug Status Flow

```
Open → In Progress → Resolved → Closed
```

### Role Permissions

| Feature       | Admin | Manager | Developer |
| ------------- | ----- | ------- | --------- |
| Create Bugs   | ✅    | ✅      | ✅        |
| Edit Own Bugs | ✅    | ✅      | ✅        |
| Edit All Bugs | ✅    | ✅      | ❌        |
| Delete Bugs   | ✅    | ✅      | ❌        |
| Assign Bugs   | ✅    | ✅      | ❌        |
| Manage Users  | ✅    | ❌      | ❌        |

## 🎯 Usage Guide

### Creating Your First Bug

1. Log in to the application
2. Click **"+ New Bug"** button
3. Fill in the bug details:
   - Title (required)
   - Description (required)
   - Priority (Low/Medium/High/Critical)
   - Assign to a team member (optional)
   - Upload attachment (optional)
4. Click **"Create Bug"**

### Generating Your Avatar

1. Go to your **Profile** page
2. Enter your **Full Name**
3. Upload a **Profile Picture** (optional but recommended)
4. Get a **Gemini API Key** from Google AI Studio
5. Paste the API key in your profile
6. Choose your **Hoodie Color**
7. Click **"💾 Save Profile"**
8. Click **"🎨 Generate Avatar"**
9. Wait 10-30 seconds for generation
10. Your avatar will be set as your profile picture!

## 🛠️ Technologies Used

### Backend

- **Flask 3.0.0** - Web framework
- **SQLite3** - Database
- **Werkzeug** - Password hashing
- **google-auth-oauthlib** - Google OAuth
- **requests-oauthlib** - GitHub OAuth
- **google-generativeai** - Gemini AI integration
- **Pillow** - Image processing

### Frontend

- **HTML5** - Markup
- **CSS3** - Styling with CSS Variables
- **JavaScript** - Interactivity
- **SVG** - Icons and graphics

## 🔒 Security Features

- ✅ Password hashing with Werkzeug
- ✅ SQL injection prevention with parameterized queries
- ✅ Session-based authentication
- ✅ CSRF protection
- ✅ File upload validation
- ✅ XSS prevention
- ✅ OAuth 2.0 secure authentication

## 📊 Statistics

- **Lines of Code**: ~2000+
- **Python Version**: 3.10+
- **Database**: SQLite3
- **Supported File Types**: PNG, JPG, GIF, PDF, TXT
- **Max File Size**: 5MB
- **Themes**: 2 (Light/Dark)

## 🚧 Roadmap

- [ ] Email notifications for bug assignments
- [ ] Bug history/audit log
- [ ] Advanced search and filtering
- [ ] Export bugs to CSV/PDF
- [ ] Kanban board view
- [ ] REST API endpoints
- [ ] Docker containerization
- [ ] CI/CD pipeline

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors

- **Swetha Mehtre** - [GitHub](https://github.com/swetha-mehtre)

## 🙏 Acknowledgments

- Google Gemini API for AI avatar generation
- Flask framework community
- Google Cloud Platform for OAuth
- GitHub for version control and OAuth
- Studio Ghibli for inspiration on avatar style

## 📞 Support

For support, email or open an issue on GitHub.

## 🌟 Show Your Support

Give a ⭐️ if this project helped you!

---

**Made with ❤️ using Flask and Python**
