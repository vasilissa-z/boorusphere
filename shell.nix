{ pkgs ? import <nixpkgs> {
  config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };
} }:
let
  buildToolsVersion = "34.0.0";

  androidComposition =  (pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "34" "31" "33" "21" "29" ];
    abiVersions = [ "arm64-v8a" "armeabi-v7a" ];
    includeNDK = true;
    includeExtras = [
      "extras;google;auto"
    ];
    buildToolsVersions = [ buildToolsVersion "30.0.3" ];
  });
in
pkgs.mkShell rec {
  buildInputs = with pkgs;[
    jdk17
    flutter324
    androidComposition.androidsdk
  ];
  nativeBuildInputs = with pkgs; [
    pkg-config
  ];
  LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}";
  OPENSSL_DIR="${pkgs.openssl.dev}";
  OPENSSL_LIB_DIR="${pkgs.openssl.out}/lib";
  ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
  ANDROID_NDK_ROOT = "${ANDROID_HOME}/ndk-bundle";

  # Use the same buildToolsVersion here
  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_HOME}/build-tools/${buildToolsVersion}/aapt2";
}
