#!/usr/bin/env bash
nix-shell --command "NVIM_SOCKET=$NVIM_SOCKET python3 main.py &"
