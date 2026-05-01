{ pkgs, ... }:

{
  nixpkgs.config = {
    android_sdk.accept_license = true;
  };

  environment.systemPackages = with pkgs; [
    slack
    google-cloud-sdk
    awscli2
    ssm-session-manager-plugin
    cargo-lambda
    gnumake
    cmake
    firebase-tools
    redli
    postgresql_18
    pspg
    androidenv.androidPkgs.androidsdk
    androidenv.androidPkgs.emulator
    androidenv.androidPkgs.platform-tools
    terragrunt
    terraform
  ];
}
