#!/bin/sh

# =========================================================
# E2 Currency Pro
# Smart Installer
# by ramzus007
# =========================================================

PLUGIN_NAME="E2 Currency Pro"

IPK_NAME="E2-Currency-Pro.ipk"

IPK_URL="https://github.com/ramzus007/E2-Currency-Pro/releases/latest/download/${IPK_NAME}"

TMP_IPK="/tmp/${IPK_NAME}"

echo ""
echo "=========================================="
echo "        ${PLUGIN_NAME}"
echo "              by ramzus007"
echo "=========================================="
echo ""

echo "Downloading ${PLUGIN_NAME}..."

rm -f "${TMP_IPK}"

if ! wget -q -O "${TMP_IPK}" "${IPK_URL}"; then
    echo "ERROR: Download failed."
    rm -f "${TMP_IPK}"
    exit 1
fi

if [ ! -s "${TMP_IPK}" ]; then
    echo "ERROR: Downloaded file is empty."
    rm -f "${TMP_IPK}"
    exit 1
fi

echo "Download completed."
echo ""

echo "Installing ${PLUGIN_NAME}..."

if ! opkg install --force-reinstall "${TMP_IPK}"; then
    echo ""
    echo "ERROR: Installation failed."
    rm -f "${TMP_IPK}"
    exit 1
fi

rm -f "${TMP_IPK}"

echo ""
echo "=========================================="
echo " E2 Currency Pro installed successfully"
echo "=========================================="
echo ""

echo "Restarting Enigma2..."

sleep 2

init 4
sleep 2
init 3

exit 0
