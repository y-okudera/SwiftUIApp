#!/usr/bin/env sh

if [ $ENABLE_PREVIEWS == "NO" ]
then
  $SRCROOT/Tools/Common/.build/release/swift-format -r $SRCROOT/SwiftUIApp/ $SRCROOT/Packages/ -i || true
  $SRCROOT/Tools/Common/.build/release/swift-format -r $SRCROOT/SwiftUIApp/ $SRCROOT/Packages/ -m lint || true
else
  echo "Skipping the script because of preview mode"
fi
