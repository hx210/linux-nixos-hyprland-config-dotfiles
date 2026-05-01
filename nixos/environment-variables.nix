{ pkgs, ... }:

{
  # Setup Env Variables
  environment.variables.SPOTIFY_PATH = "${pkgs.spotify}/";
  environment.variables.JDK_PATH = "${pkgs.jdk17}/";
  environment.variables.NODEJS_PATH = "${pkgs.nodejs}/";
}
