#!/bin/bash
set -e

FRAMEWORK_NAME="FinalPack"
VERSION="$1"
BUILD_DIR="./build"
RELEASE_DIR="./Releases"
PACKAGE_FILE="Package.swift"
SOURCE_PACKAGE_FILE="Package.source.swift"
ZIP_PATH="$RELEASE_DIR/${FRAMEWORK_NAME}.xcframework.zip"

# ======== Validation ========
if [[ -z "$VERSION" ]]; then
  echo "❌ Usage: ./release.sh <version>"
  exit 1
fi

# ======== Prepare ========
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/archives" "$BUILD_DIR/xcframeworks" "$RELEASE_DIR"

echo "🔧 Saving source-based Package.swift"
cp "$PACKAGE_FILE" "$SOURCE_PACKAGE_FILE"

# ======== Build Framework ========
echo "📦 Building $FRAMEWORK_NAME..."

xcodebuild archive \
  -scheme "$FRAMEWORK_NAME" \
  -sdk iphoneos \
  -archivePath "$BUILD_DIR/archives/device.xcarchive" \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -scheme "$FRAMEWORK_NAME" \
  -sdk iphonesimulator \
  -archivePath "$BUILD_DIR/archives/sim.xcarchive" \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
  -framework "$BUILD_DIR/archives/device.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -framework "$BUILD_DIR/archives/sim.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -output "$BUILD_DIR/xcframeworks/$FRAMEWORK_NAME.xcframework"

echo "📦 Zipping..."
(cd "$BUILD_DIR/xcframeworks" && zip -r -X "../../$ZIP_PATH" "$FRAMEWORK_NAME.xcframework" > /dev/null)

# ======== Create binary-only Package.swift ========
echo "📝 Writing binary-only Package.swift..."
cat > "$PACKAGE_FILE" <<EOF
// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "$FRAMEWORK_NAME",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "$FRAMEWORK_NAME",
            targets: ["$FRAMEWORK_NAME"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "$FRAMEWORK_NAME",
            path: "$ZIP_PATH"
        )
    ]
)
EOF

# ======== Commit and Tag Release ========
echo "📂 Committing binary package and tag..."
git add "$PACKAGE_FILE" "$ZIP_PATH"
git commit -m "Release $VERSION (binary)"
git tag "$VERSION"
git push
git push origin "$VERSION"

# ======== Restore original Package.swift ========
echo "🔁 Restoring source-based Package.swift"
mv "$SOURCE_PACKAGE_FILE" "$PACKAGE_FILE"

echo "✅ Done: $FRAMEWORK_NAME $VERSION released using local binary."