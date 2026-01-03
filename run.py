#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Bug Tracker Application Launcher
"""
import sys
import os

# Add project to path
sys.path.insert(0, os.path.dirname(__file__))

if __name__ == '__main__':
    try:
        print("[*] Starting Bug Tracker Application...")
        print("[*] Loading dependencies...")
        
        from app import app
        print("[OK] App loaded successfully")
        
        # Run the Flask app
        print("\n" + "="*60)
        print("[START] Bug Tracker is running!")
        print("="*60)
        print("[INFO] Access the application at:")
        print("   http://localhost:5000")
        print("   or")
        print("   http://127.0.0.1:5000")
        print("\n[INFO] Login with:")
        print("   - Email/Password")
        print("   - Google OAuth")
        print("   - GitHub OAuth")
        print("\n[INFO] Avatar Generation:")
        print("   Get Gemini API key: https://makersuite.google.com/app/apikey")
        print("="*60 + "\n")
        
        app.run(
            debug=True,
            host='0.0.0.0',
            port=5000,
            use_reloader=True
        )
        
    except Exception as e:
        print("\n[ERROR] Error starting application:")
        print("   %s: %s" % (type(e).__name__, str(e)))
        import traceback
        traceback.print_exc()
        sys.exit(1)
