#!/bin/sh
curl -L https://foundry.paradigm.xyz | bash;
PATH="$PATH:$HOME/.foundry/bin" foundryup;

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
PATH="$PATH:$HOME/.cargo/bin" cargo install --locked just;
PATH="$PATH:$HOME/.cargo/bin" cargo install --locked ldenv;

