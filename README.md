# Cursor AI Terminal

A terminal-based interface for managing Cursor AI installation and configuration.

```
╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║                           FISAMY CURSOR RESET                             ║
║                                                                           ║
║                     © 2025 FISAMY. All Rights Reserved                    ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

## Features

- 🔄 Reset Cursor AI installation
- 🔍 System requirements check
- 📝 License management
- 🛠️ Post-installation configuration
- 💻 Cross-platform support (macOS & Windows)

## Requirements

### macOS
- macOS 10.10 or later
- ARM64 architecture (M1/M2)
- 4GB RAM minimum
- 2GB free disk space

### Windows

Prerequisites:
- Git Bash (Required) - [Download here](https://git-scm.com/download/win)
- PowerShell or Command Prompt (Admin)

Method 1: Using PowerShell
```powershell
# Download both required scripts
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/fisapool/FISACursorReset/main/cursor-terminal.bat" -OutFile "cursor-terminal.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/fisapool/FISACursorReset/main/cursor-terminal.sh" -OutFile "cursor-terminal.sh"

# Run the script
.\cursor-terminal.bat
```

Method 2: Manual Download
1. Visit [FISACursorReset](https://github.com/fisapool/FISACursorReset)
2. Download both `cursor-terminal.bat` and `cursor-terminal.sh`
3. Place both files in the same directory
4. Double-click `cursor-terminal.bat` to run

### Verification

After installation, verify that:
- Script has executable permissions (macOS)
- No antivirus blocking (Windows)
- Terminal has administrative privileges

### Troubleshooting

If you encounter permission issues on macOS:
```bash
# Grant full permissions
sudo chmod +x cursor-terminal.sh

# Run with sudo if needed
sudo ./cursor-terminal.sh
```

For Windows permission issues:
1. Right-click cursor-terminal.bat
2. Select "Run as administrator"

### Post-Installation

After successful installation:
1. Launch Cursor AI
2. Use a new Gmail account to sign in
3. Follow the post-installation steps in the terminal
4. Check system requirements if you encounter issues

## Usage Guide

1. Launch the terminal
2. Choose from options:
   ```
   [A] Reset Cursor AI          Complete reset and fresh installation
   [C] System Requirements      Check if your system meets requirements
   [D] License Information     View licensing details and requirements
   [E] Post-Install Steps      View steps to complete after installation
   [Q] Quit                    Exit the installation guide
   ```

## Important Notes

- Always use a new Gmail account for registration
- Temporary email addresses are not recommended
- If you hit trial limits, simply run the reset option
- Purchase from FISAMY Shopee Store for extended support

## Version Support

- ✅ Supported: v0.44.11
- ❌ Not Supported: v0.45.x and above

## Support

Need help? Contact:
- 🛍️ [FISAMY Shopee Store](https://fisamy.rhinopal.top/)
- 📧 Fisamy Support Team

## License

Copyright (c) 2025 FISAMY

All rights reserved.

This software and associated documentation files (the "Software") are the proprietary 
property of FISAMY and are protected by copyright law. The Software is provided for 
personal use only and may not be redistributed without explicit permission from FISAMY.

Terms and Conditions:

1. You may use this Software for personal use only.
2. You may not distribute, sell, or make the Software available to third parties.
3. You may not modify, reverse engineer, or create derivative works of the Software.
4. This Software is provided "as is" without warranty of any kind.

For licensing inquiries:
- 🛍️ [FISAMY Store](https://shopee.com.my/fisa_trading?)
- 📧 Contact FISAMY Support