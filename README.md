# template-foundry

A template to build, deploy and test smart contracts using [foundry-rs/forge](https://github.com/foundry-rs/foundry) and [forge-deploy](https://github.com/wighawag/forge-deploy)

## How to use ?

Once your environment is setup (see [requirements](#requirements) and [setup](#setup)), you can do the following using [just](https://just.systems):

### Compile your contracts

```
just compile
```

### Test your contracts

```
just test
```

See how the [GreetingsRegistry.t.sol](test/GreetingsRegistry.t.sol) test use the deploy script to get setup, removing the need to duplicate the deployment procedure.

### watch for changes and rebuild automatically

```
just watch
```

### deploy your contract

- in memory only:

  ```
  just deploy
  ```

- on localhost

  This assume you have anvil running : `anvil`

  ```
  just deploy localhost
  ```

- on a network of your choice configured via `.env.<network>.local` (see [.env.localhost](.env.localhost))

  ```
  just deploy <network>
  ```

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
