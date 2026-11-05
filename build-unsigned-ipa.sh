#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT="$PROJECT_DIR/FitPulse.xcodeproj"
BUILD_DIR="$PROJECT_DIR/build"
APP_PATH="$BUILD_DIR/Build/Products/Release-iphoneos/FitPulse.app"
PAYLOAD_DIR="$BUILD_DIR/ipa/Payload"
OUTPUT="$PROJECT_DIR/FitPulse-unsigned.ipa"

if ! command -v xcodebuild >/dev/null 2>&1; then
    echo "Errore: installa Xcode e i relativi strumenti da riga di comando sul Mac." >&2
    exit 1
fi

xcodebuild \
    -project "$PROJECT" \
    -scheme FitPulse \
    -configuration Release \
    -sdk iphoneos \
    -derivedDataPath "$BUILD_DIR" \
    CODE_SIGNING_ALLOWED=NO \
    build

if [ ! -d "$APP_PATH" ]; then
    echo "Errore: Xcode non ha prodotto FitPulse.app nel percorso atteso." >&2
    exit 1
fi

rm -rf "$BUILD_DIR/ipa"
mkdir -p "$PAYLOAD_DIR"
cp -R "$APP_PATH" "$PAYLOAD_DIR/FitPulse.app"
rm -f "$OUTPUT"
(
    cd "$BUILD_DIR/ipa"
    /usr/bin/zip -qry "$OUTPUT" Payload
)

echo "IPA non firmato creato: $OUTPUT"
echo "Aprilo con Sideloadly e firma con il tuo Apple ID per installarlo."
