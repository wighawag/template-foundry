curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
source "$HOME/.cargo/env"
curl -L https://foundry.paradigm.xyz | bash;
export PATH="$PATH:$HOME/.foundry/bin";
foundryup;
cargo install --locked just;
cargo install --locked ldenv;
