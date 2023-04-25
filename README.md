# template-foundry

A template to build, deploy and test smart contracts using [foundry-rs/forge](https://github.com/foundry-rs/foundry) and [forge-deploy](https://github.com/wighawag/forge-deploy)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/wighawag/template-foundry)

## How to use ?

Once your environment is setup (see [setup](#setup)), you can do the following (assuming you have bash/zsh)

### Compile your contracts

```bash
./run compile
```

### Test your contracts

```bash
./run test
```

See how the [Counter.t.sol](test/Counter.t.sol) test use the deploy script to get setup, removing the need to duplicate the deployment procedure.

### watch for changes and rebuild automatically

```bash
./run watch
```

### deploy your contract

- in memory only:

  ```bash
  ./run deploy void
  ```

- on localhost

  This assume you have anvil running : `anvil`

  ```bash
  ./run deploy localhost
  ```

- on a network of your choice

  Just make sure you have `RPC_URL` or `RPC_URL_<network>` set for it either in `env.local` or `.env.<network>.local`

  ```bash
  ./run deploy <network>
  ```

### execute script on the deployed contract

```bash
./run script localhost script/UpdateCounter.s.sol --sig 'run(uint256)' 42;
```

## requirements:

- cargo (for dependencies and tools) : https://www.rust-lang.org/learn/get-started

- ldenv (a env loader) : https://crates.io/crates/ldenv

- watchexec-cli (optional, for watch command) :

  Checkout the instalation procedure here : https://github.com/watchexec/watchexec

  You can alternatively install watchexec-cli from source but this will take sone time

  ```bash
  cargo install --locked watchexec-cli;
  ```

- foundry (for contracts) : https://getfoundry.sh/

## Setup

Before getting started we need to execute the following to have the environment ready

```bash
./run install
```

> Note: By default this install dependencies without git submodule
> If you use git and want to make use of the submodule. Use the following command instead:

```bash
./run install git
```

See version specified in the [run](./run)
