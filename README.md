# template-foundry

A template to build, deploy and test smart contracts using foundry-rs/forge and forge-deploy

## requirements:

- cargo (for dependencies and tools) : https://www.rust-lang.org/learn/get-started

  ```
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
  ```

  This allow you to install the following tools:

  - just (a make-like tool) : https://just.systems

    ```
    cargo install --locked just;
    ```

  - ldenv (a env loader) : https://crates.io/crates/ldenv
    ```
    cargo install --locked ldenv;
    ```

  - watchexec-cli (a file watcher executor) : https://github.com/watchexec/watchexec
    ```
    cargo install --locked watchexec-cli;
    ```


- foundry (for contracts) : https://getfoundry.sh/

  ```
  curl -L https://foundry.paradigm.xyz | bash; foundryup;
  ```

## Setup

Before getting started we need to execute the following to have the environment ready

```
just install
```

See version specified in the [justfile](./justfile)