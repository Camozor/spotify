{ pkgs ? import <nixpkgs> { } }:

let
  pythonEnv = pkgs.python3.withPackages
    (ps: with pkgs; [ python311Packages.dbus-next python311Packages.pynvim ]);

in pkgs.mkShell { packages = [ pythonEnv ]; }
