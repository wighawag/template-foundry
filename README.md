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

Before getting started we need to execute the following 2 commands to have the environment ready:

1. The first one will install cargo and foundry if there are not already installed.

   it will also install 2 command line utitilies: ldenv (required) and fzf (a useful fuzzy finder used by `./run`)

   ```bash
   ./run _setup_system
   ```

2. The second one will install the local dependencies

   ```bash
   ./run install
   ```

it can be refreshed via (you can also change the version in [./run](./run))

```bash
./run _reinstall
```

> Note: By default this install dependencies without git submodule
> If you use git and want to make use of the submodule. Use the following command instead:

```bash
./run install git
```

See version specified in the [run](./run)

### Windows

Tested from a fresh install of : https://www.microsoft.com/en-US/software-download/windows10ISO on [virtualbox](https://www.virtualbox.org/).

You need to install [Visual Studio Community](https://visualstudio.microsoft.com/free-developer-offers/) on it.

This is the [direct link](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&passive=false&cid=2030) to the Installer (as of today, 2023/04/26) :

You have to install the installer and then install Visual Studio Community with it.

!! **Do not forget to pick the "Desktop Development With C++" in the "Worloads" tab. You do not need anything more.**

Next we want to install bash if you do not have already. For that we are using git which comes with bash.

You can install it via [scoop](https://scoop.sh/).

```bat
scoop install git
```

Or you can use the installer from https://gitforwindows.org/.

If you that last option, you can choose "Use Git and optional Unix tolls from the Command Prompt" and you'll have bash accessible from cmd.exe. otherwise you need to use "Git Bash Here"

Anyway after that you should be able to get into a bash shell.

```bat
bash
```

There you can clone the repo if you did not already and cd into it.

```bash
git clone https://github.com/wighawag/template-foundry.git
cd template-foundry
```

There you can now install the dependencies using the 2 following command .

1. The first one will install cargo and foundry if there are not already installed. This need to be executed only once.

   it will also install 2 command line utitilies: ldenv (required) and fzf (a useful fuzzy finder used by `./run`)

   ```bash
   ./run _setup_system
   ```

2. The second one will install the local dependencies

   ```bash
   ./run install
   ```

   it can be refreshed via (you can also change the version in [./run](./run))

   ```bash
   ./run _reinstall
   ```

This does not install watchexec-cli (that is used for watching file changes) but we can install it now either:

- by downloading the binary from here : https://watchexec.github.io/downloads/watchexec/ and add it to your PATH
- or by building it from source via `cargo`
  ```bash
  cargo install watchexec-cli
  ```

Once the setup is done, you ll have to leave and reenter bash or execute the following to get the new PATH in

```bash
source ~/.bashrc
```

#### wezterm

We recommend you install [wezterm](https://wezfurlong.org/wezterm/install/windows.html).

With that you can do the following to get started:

```bash
pnpm start
```
