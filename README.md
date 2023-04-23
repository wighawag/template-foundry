# template-foundry

A template to build, deploy and test smart contracts using [foundry-rs/forge](https://github.com/foundry-rs/foundry) and [forge-deploy](https://github.com/wighawag/forge-deploy)

## How to use ?

Once your environment is setup (see [requirements](#requirements) and [setup](#setup)), you can do the following using [just](https://just.systems):

### Compile your contracts

```bash
just compile
```

### Test your contracts

```bash
just test
```

See how the [GreetingsRegistry.t.sol](test/GreetingsRegistry.t.sol) test use the deploy script to get setup, removing the need to duplicate the deployment procedure.

### watch for changes and rebuild automatically

```bash
just watch
```

### deploy your contract

- in memory only:

  ```bash
  just deploy
  ```

- on localhost

  This assume you have anvil running : `anvil`

  ```bash
  just deploy localhost
  ```

- on a network of your choice configured via `.env.<network>.local` (see [.env.localhost](.env.localhost))

  ```bash
  just deploy <network>
  ```

## requirements:

- cargo (for dependencies and tools) : https://www.rust-lang.org/learn/get-started

  ```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
  ```

  This allow you to install the following tools:

  - just (a make-like tool) : https://just.systems

    ```bash
    cargo install --locked just;
    ```

  - ldenv (a env loader) : https://crates.io/crates/ldenv

    ```bash
    cargo install --locked ldenv;
    ```

  - watchexec-cli (optional, for watch command) :

    Checkout the instalation procedure here : https://github.com/watchexec/watchexec

    You can alternatively install watchexec-cli from source but this will take sone time

    ```bash
    cargo install --locked watchexec-cli;
    ```

- foundry (for contracts) : https://getfoundry.sh/

  ```bash
  curl -L https://foundry.paradigm.xyz | bash; foundryup;
  ```

  You can execute the the `requirements.sh` file to get all of them setup (minus watchexec-cli)

  ```
  chmod u+x ./requirements.sh && ./requirements.sh
  ```

## Setup

Before getting started we need to execute the following to have the environment ready

```bash
just install
```

> Note: By default this install dependencies without git submodule
> If you use git and want to make use of the submodule. Use the following command instead:

```bash
just install git
```

See version specified in the [justfile](./justfile)
