FROM mcr.microsoft.com/devcontainers/universal:2.0.24-focal

USER codespace

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.69.0;

RUN curl -L https://foundry.paradigm.xyz | bash;
RUN PATH="$PATH:$HOME/.cargo/bin:$HOME/.foundry/bin" foundryup -v nightly-dedc31eed0683764ae542b9b575c21f6bd2a5c60

RUN PATH="$PATH:$HOME/.cargo/bin" cargo install --version 1.13.0 just;
RUN PATH="$PATH:$HOME/.cargo/bin" cargo install --version 0.0.3 ldenv;
RUN PATH="$PATH:$HOME/.cargo/bin" cargo install --version 1.22.2 watchexec-cli;

# INSTALL fzf
RUN git clone --branch 0.39.0 --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install
