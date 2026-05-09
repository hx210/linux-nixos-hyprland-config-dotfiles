{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wasmedge
    # wasmer
    wasmi
    wrangler
    fermyon-spin
    wash-cli
    # wasm3
  ];
}
