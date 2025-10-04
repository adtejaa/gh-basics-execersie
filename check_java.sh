#!/usr/bin/env bash
# --------------------------------------------------------------------
#  check_java.sh
#
#  Purpose:  Detect if Java is installed on macOS and report
#            the version that would be used by the shell.
#
#  Usage:    ./check_java.sh
#
#  Notes:
#    • Works with the system‑wide Java (Apple / Oracle / AdoptOpenJDK)
#    • Works with Homebrew‑installed Java (via `brew install --cask java`)
#    • Prints a clear message and exits with 0 if Java is present,
#      otherwise exits with 1.
# --------------------------------------------------------------------

# Function to output logs with timestamp and color
log() {
    local level="$1"
    local msg="$2"
    local ts
    ts=$(date +"%Y-%m-%d %H:%M:%S")
    case "$level" in
        info)
            printf "\e[34m[INFO] %s - %s\e[0m\n" "$ts" "$msg"
            ;;
        success)
            printf "\e[32m[SUCCESS] %s - %s\e[0m\n" "$ts" "$msg"
            ;;
        error)
            printf "\e[31m[ERROR] %s - %s\e[0m\n" "$ts" "$msg"
            ;;
        *)
            printf "[LOG] %s - %s\n" "$ts" "$msg"
            ;;
    esac
}

# 1. Try to locate the `java` executable in the current PATH
if ! command -v java >/dev/null 2>&1; then
    log error "Java is NOT installed on this machine."
    exit 1
fi

# 2. Capture the version string (stderr is used by `java -version`)
JAVA_VERSION_OUTPUT=$(java -version 2>&1 | head -n 1)

# 3. Pretty‑print the result
log success "Java is installed."
log info "Version info: $JAVA_VERSION_OUTPUT"

# 4. Exit with success
exit 0