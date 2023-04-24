NDK=$ANDROID_NDK_ROOT
ABI=arm64-v8a
MINSDKVERSION=30
BUILD_DIR=build-aarch64-android
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

cmake \
    -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ABI \
    -DANDROID_PLATFORM=android-$MINSDKVERSION \
    --no-warn-unused-cli \
    -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -DCMAKE_INSTALL_PREFIX=$(pwd)/$BUILD_DIR/out-br \
    -DBUILD_SHARED_LIBS=OFF \
    -S$(pwd) \
    -B$(pwd)/$BUILD_DIR \
    -G Ninja

ninja -C $BUILD_DIR install
