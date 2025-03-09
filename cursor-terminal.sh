#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BLUE='\033[0;34m'
SILVER='\033[0;37m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m'

# Configuration
PACKAGE_VERSION="0.44.11"
CONFIG_DIR="$HOME/.cursor-ai"
LOG_FILE="$CONFIG_DIR/cursor.log"

# Create config directory and log file
mkdir -p "$CONFIG_DIR"
touch "$LOG_FILE"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Clear screen with platform check
clear_screen() {
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        cmd.exe /c cls
    else
        clear
    fi
}

# Print banner function
print_banner() {
    clear_screen
    echo -e "\n${SILVER}███████╗${YELLOW}██╗${ORANGE}███████╗ █████╗ ███╗   ███╗██╗   ██╗"
    echo -e "${SILVER}██╔════╝${YELLOW}██║${ORANGE}██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝"
    echo -e "${SILVER}█████╗  ${YELLOW}██║${ORANGE}███████╗███████║██╔████╔██║ ╚████╔╝"
    echo -e "${SILVER}██╔══╝  ${YELLOW}██║${ORANGE}╚════██║██╔══██║██║╚██╔╝██║  ╚██╔╝"
    echo -e "${SILVER}██║     ${YELLOW}██║${ORANGE}███████║██║  ██║██║ ╚═╝ ██║   ██║"
    echo -e "${SILVER}╚═╝     ${YELLOW}╚═╝${ORANGE}╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝${NC}\n"
}

# Show menu function
show_menu() {
    echo -e "\n${SILVER}Available Options:${NC}\n"
    
    echo -e "  ${GREEN}[A]${NC} Reset Cursor AI          ${SILVER}Complete reset and fresh installation${NC}"
    echo -e "  ${YELLOW}[C]${NC} System Requirements      ${SILVER}Check if your system meets requirements${NC}"
    echo -e "  ${ORANGE}[D]${NC} License Information     ${SILVER}View licensing details and requirements${NC}"
    echo -e "  ${BLUE}[E]${NC} Post-Install Steps      ${SILVER}View steps to complete after installation${NC}"
    echo -e "  ${RED}[Q]${NC} Quit                    ${SILVER}Exit the installation guide${NC}\n"
    
    echo -e "${SILVER}Select an option [${GREEN}A${NC}/${YELLOW}C${NC}/${ORANGE}D${NC}/${BLUE}E${NC}/${RED}Q${NC}]: ${NC}"
}

# Show license info
show_license_info() {
    clear_screen
    print_banner
    echo -e "\n${BLUE}License Requirements${NC}"
    echo -e "${BLUE}──────────────────${NC}"
    echo -e "\n• Sign Up again using NEW Gmail Account, temporary mail may not always work. You can purchase from FISAMY Shopee Store"
    echo -e "• If there Trial Limit , you can revisit this Terminal and start again the process"
    echo -e "• Sign Up again using NEW Gmail Account, temporary mail may not always work. You can purchase from FISAMY Shopee Store"
    echo -e "\n${SILVER}Press Enter to return to main menu...${NC}"
    read
}

# Show post-installation steps
show_post_install_steps() {
    clear_screen
    print_banner
    POST_INSTALL
    echo -e "\n${SILVER}Press Enter to return to main menu...${NC}"
    read
}

# Main menu loop
main_menu() {
    while true; do
        clear_screen
        print_banner
        show_menu
        
        read -n 1 -r option
        echo ""
        
        case $option in
            [Aa])
                clear_screen
                print_banner
                check_system
                uninstall_cursor
                install_cursor
                run_id_modifier
                POST_INSTALL
                echo -e "\n${SILVER}Press Enter to return to main menu...${NC}"
                read
                ;;
            [Cc])
                clear_screen
                print_banner
                check_system
                check_requirements
                echo -e "\n${SILVER}Press Enter to return to main menu...${NC}"
                read
                ;;
            [Dd])
                show_license_info
                ;;
            [Ee])
                show_post_install_steps
                ;;
            [Qq])
                clear_screen
                echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
                echo -e "${BLUE}║ Thank you for using Cursor AI Reset! ║${NC}"
                echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option. Please try again.${NC}"
                sleep 2
                ;;
        esac
    done
}

# Package information
PACKAGE_NAME="cursor-ai"
PACKAGE_VERSION="0.44.11"
PACKAGE_DESCRIPTION="Cursor AI Development Environment"
PACKAGE_MAINTAINER="Fisamy Support <support@fisamy.work>"
PACKAGE_HOMEPAGE="https://fisamy.rhinopal.top/"
PACKAGE_DEPENDS="curl, unzip, bc"

# Installation directories
if [[ "$EUID" -eq 0 ]]; then
    INSTALL_DIR="/opt/cursor-ai"
    BIN_DIR="/usr/local/bin"
else
    INSTALL_DIR="$HOME/.local/opt/cursor-ai"
    BIN_DIR="$HOME/.local/bin"
    mkdir -p "$INSTALL_DIR" "$BIN_DIR"
fi

# Check OS type and architecture
check_system() {
    echo -e "\n${BLUE}╔══════════════════════════════╗${NC}"
    echo -e "${BLUE}║   System Requirements Check   ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════╝${NC}"
    
    ARCH=$(uname -m)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo -e "\n🍎 ${GREEN}Detected macOS system${NC}"
        PLATFORM="mac"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo -e "\n🐧 ${GREEN}Detected Linux system${NC}"
        PLATFORM="linux"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        echo -e "\n🪟 ${GREEN}Detected Windows system${NC}"
        PLATFORM="windows"
    else
        echo -e "\n❌ ${RED}Unsupported operating system${NC}"
        exit 1
    fi

    # Architecture check
    if [[ "$ARCH" != "x86_64" && "$ARCH" != "arm64" ]]; then
        echo -e "\n❌ ${RED}Unsupported architecture: $ARCH${NC}"
        exit 1
    fi
}

# System requirements check
check_requirements() {
    echo -e "\n${BLUE}╔════════════════════════════════════════════════════════════════════════════╗"
    echo -e "║                           System Requirements Check                            ║"
    echo -e "╚════════════════════════════════════════════════════════════════════════════╝${NC}\n"

    echo -e "${SILVER}Checking system specifications...${NC}\n"
    
    if [[ "$PLATFORM" == "windows" ]]; then
        # Windows checks
        TOTAL_RAM=$(powershell -command "Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | Select-Object -ExpandProperty Sum" 2>/dev/null | awk '{print $1/1024/1024/1024}')
        FREE_SPACE=$(powershell -command "Get-PSDrive C | Select-Object -ExpandProperty Free" 2>/dev/null | awk '{print $1/1024/1024/1024}')
    elif [[ "$PLATFORM" == "mac" ]]; then
        # macOS checks
        TOTAL_RAM=$(sysctl hw.memsize | awk '{print $2/1024/1024/1024}')
        FREE_SPACE=$(df -h / | awk 'NR==2 {print $4}' | sed 's/Gi//')
    elif [[ "$PLATFORM" == "linux" ]]; then
        # Linux checks
        TOTAL_RAM=$(free -g | awk '/^Mem:/{print $2}')
        FREE_SPACE=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
    fi

    if (( $(echo "$TOTAL_RAM < 4" | bc -l) )); then
        echo -e "\n❌ ${RED}Minimum 4GB RAM required${NC}"
        exit 1
    fi

    if (( $(echo "$FREE_SPACE < 2" | bc -l) )); then
        echo -e "\n❌ ${RED}Minimum 2GB free disk space required${NC}"
        exit 1
    fi

    echo -e "\n${GREEN}System Requirements:${NC}"
    echo -e "  • RAM: ${SILVER}${TOTAL_RAM}GB${NC} / ${GREEN}4GB Required${NC}"
    echo -e "  • Free Space: ${SILVER}${FREE_SPACE}GB${NC} / ${GREEN}2GB Required${NC}"
    echo -e "  • Architecture: ${SILVER}$ARCH${NC}"
    echo -e "  • Platform: ${SILVER}$PLATFORM${NC}\n"
}

# Installation function
install_cursor() {
    echo -e "\n${BLUE}Installing Cursor v${PACKAGE_VERSION}${NC}"
    echo -e "${BLUE}──────────────────${NC}\n"
    
    # Create necessary directories
    mkdir -p "$INSTALL_DIR/bin" "$INSTALL_DIR/lib" "$INSTALL_DIR/share" || {
        echo -e "\n❌ ${RED}Failed to create installation directories${NC}"
        exit 1
    }

    if [[ $PLATFORM == "mac" ]]; then
        if [[ $ARCH == "arm64" ]]; then
            DOWNLOAD_URL="https://dl.todesktop.com/230313mzl4w4u92/versions/${PACKAGE_VERSION}/mac/zip/arm64"
            curl -L -o "$INSTALL_DIR/cursor.zip" "$DOWNLOAD_URL" || {
                echo -e "\n❌ ${RED}Download failed${NC}"
                exit 1
            }
            
            # Extract with error checking
            unzip -q "$INSTALL_DIR/cursor.zip" -d "$INSTALL_DIR" || {
                echo -e "\n❌ ${RED}Extraction failed${NC}"
                exit 1
            }
            
            # Create symlink
            ln -sf "$INSTALL_DIR/Cursor.app" "/Applications/Cursor.app"
            ln -sf "$INSTALL_DIR/Cursor.app/Contents/MacOS/Cursor" "$BIN_DIR/cursor"
            
            # Cleanup
            rm "$INSTALL_DIR/cursor.zip"
        else
            echo -e "\n❌ ${RED}Intel Mac version must be downloaded manually${NC}"
            exit 1
        fi
    elif [[ $PLATFORM == "windows" ]]; then
        DOWNLOAD_URL="https://downloader.cursor.sh/builds/250103fqxdt5u9z/windows/nsis/x64"
        curl -L -o "$INSTALL_DIR/cursor_setup.exe" "$DOWNLOAD_URL"
        
        if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
            "$INSTALL_DIR/cursor_setup.exe"
            rm "$INSTALL_DIR/cursor_setup.exe"
        fi
    fi
    
    echo -e "\n✅ ${GREEN}Installation completed successfully${NC}"
}

# Uninstallation function
uninstall_cursor() {
    echo -e "\n${BLUE}╔══════════════════════════════╗${NC}"
    echo -e "${BLUE}║   Uninstalling Cursor...     ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════╝${NC}"
    
    if [[ $PLATFORM == "mac" ]]; then
        rm -rf "/Applications/Cursor.app"
        rm -f "$BIN_DIR/cursor"
    fi
    
    rm -rf "$INSTALL_DIR"

    echo -e "\n✅ ${GREEN}Uninstallation completed!${NC}"
}

# Define all functions before using them
POST_INSTALL() {
    echo -e "\n${BLUE}Installation Complete!${NC}"
    echo -e "${BLUE}──────────────────${NC}"
    echo -e "\n📝 ${GREEN}Post-Installation Steps:${NC}"
    echo "• Launch Cursor"
    echo "• Sign Up again using NEW Gmail Account, temporary mail may not always work. You can purchase from FISAMY Shopee Store"
    echo "• If there Trial Limit , you can revisit this Terminal and start again the process"
}

run_id_modifier() {
    echo -e "\n${BLUE}Resetting Cursor AI...${NC}"
    echo -e "${BLUE}──────────────────${NC}"
    if [[ $PLATFORM == "mac" ]]; then
        echo -e "\n📝 ${GREEN}Applying macOS configuration...${NC}"
        curl -fsSL https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_mac_id_modifier.sh | sudo bash
    else
        echo -e "\n📝 ${GREEN}Applying Windows configuration...${NC}"
        powershell -Command "irm https://raw.githubusercontent.com/yuaotian/go-cursor-help/refs/heads/master/scripts/run/cursor_win_id_modifier.ps1 | iex"
    fi
}

# Main script execution
main() {
    case "$1" in
        install)
            check_system
            check_requirements
            install_cursor
            run_id_modifier
            POST_INSTALL
            ;;
        uninstall)
            check_system
            uninstall_cursor
            ;;
        *)
            main_menu
            ;;
    esac
}

# Version compatibility check
CURSOR_VERSION="0.44.11"
echo -e "\n${BLUE}╔══════════════════════════════╗${NC}"
echo -e "${BLUE}║   Version Compatibility      ║${NC}"
echo -e "${BLUE}╚══════════════════════════════╝${NC}"
echo -e "\n✅ ${GREEN}Installing Cursor v${CURSOR_VERSION}${NC}"
echo -e "❌ ${RED}Cursor v0.45.x and above are not supported${NC}"

# License check
echo -e "\n${BLUE}╔══════════════════════════════╗${NC}"
echo -e "${BLUE}║   License Requirements       ║${NC}"
echo -e "${BLUE}╚══════════════════════════════╝${NC}"
echo "• Sign Up again using NEW Gmail Account, temporary mail may not always work. You can purchase from FISAMY Shopee Store"
echo "• If there Trial Limit , you can revisit this Terminal and start again the process"

# Logging
log "Starting installation process"
log "Platform: $PLATFORM, Architecture: $ARCH"
log "Installation directory: $INSTALL_DIR"

# Start the application
main_menu
