#!/bin/bash

# Usage: ./release.sh v0.0.2

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: ./release.sh <version>"
  exit 1
fi

# Build the package
echo "Building package..."
pnpm run package

# Add dist folder
echo "Adding dist folder..."
git add -f dist

# Commit with version
echo "Committing..."
git commit -m "chore: build for release $VERSION"

# Create and push tag
echo "Creating tag $VERSION..."
git tag $VERSION
git push origin $VERSION

# Remove dist from staging (keep working tree clean)
echo "Cleaning up..."
git reset --soft HEAD~1
git restore --staged dist

echo "Done! Create GitHub release at: https://github.com/rogerpence/sv-pkg/releases"
echo "Then install with: pnpm add github:rogerpence/sv-pkg#$VERSION"
