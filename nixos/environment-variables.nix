{ config, pkgs, ... }:

{
  # Setup Env Variables
  environment.variables.SPOTIFY_PATH = "${pkgs.spotify}/";
  environment.variables.JDK_PATH = "${pkgs.jdk17}/";
  environment.variables.NODEJS_PATH = "${pkgs.nodejs}/";
  environment.variables.ANDROID_SDK_ROOT = "${config.users.users.xnm.home}/android-sdk";
  environment.variables.ANDROID_AVD_HOME = "${config.users.users.xnm.home}/.android/avd";
}
