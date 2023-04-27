# template-foundry

A template to build, deploy and test smart contracts using [foundry-rs/forge](https://github.com/foundry-rs/foundry) and [forge-deploy](https://github.com/wighawag/forge-deploy)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/wighawag/template-foundry)

## How to use ?

You need to have these installed

- [nodejs](https://nodejs.org/en)

- [pnpm](https://pnpm.io/) (can be installed via: `npm i -g pnpm`)

- [foundry](https://getfoundry.sh/) (can be installed via: `curl -L https://foundry.paradigm.xyz | bash && source $HOME/.bashrc && foundryup`)

Then you need to install the local dependencies with the following command:

```bash
pnpm i;
```

### Compile your contracts

```bash
pnpm compile
```

### Test your contracts

```bash
pnpm test
```

See how the [Counter.t.sol](test/Counter.t.sol) test use the deploy script to get setup, removing the need to duplicate the deployment procedure.

### watch for changes and rebuild automatically

```bash
pnpm watch_compile
```

### deploy your contract

- in memory only:

  ```bash
  pnpm run deploy void
  ```

- on localhost

  This assume you have anvil running : `anvil`

  ```bash
  pnpm run deploy localhost
  ```

- on a network of your choice

  Just make sure you have `RPC_URL` or `RPC_URL_<network>` set for it either in `env.local` or `.env.<network>.local`

  ```bash
  pnpm run deploy <network>
  ```

### execute script on the deployed contract

```bash
pnpm script localhost script/UpdateCounter.s.sol --sig 'run(uint256)' 42;
```

## Setup

Before getting started we need to execute the following 3 commands to have the environment ready:

1. assuming you already have node installed

   ```bash
   pnpm i
   ```

1. install cargo and foundry if there are not already installed.

   ```bash
   ./setup system
   ```

1. install the local dependencies

   ```bash
   ./setup install
   ```

it can be refreshed via (you can also change the version in [./setup](./setup))

```bash
./setup reinstall
```

> Note: By default this install dependencies without git submodule
> If you use git and want to make use of the submodule. Use the following command instead:

```bash
./setup install git
```

See version specified in the [setup](./setup)

### zellij

[zellij(https://zellij.dev/)] is a useful multiplexer (think tmux) for which we have included a [layout file](./zellij.kdl) to get started

Once installed simply run

```bash
pnpm start
```

And you'll have anvil running as well as watch process deploying contract on src changes

if you want to try zellij without install try this :

```bash
bash <(curl -L zellij.dev/launch) --layout zellij.kdl
```

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

1. assuming you already have node installed (see general instruction above)

   ```bash
   pnpm i
   ```

1. install cargo and foundry if there are not already installed.

   ```bash
   ./setup system
   ```

1. install the local dependencies

   ```bash
   ./setup install
   ```

   it can be refreshed via (you can also change the version in [./setup](./setup))

   ```bash
   ./setup reinstall
   ```

Once the setup is done, you ll have to leave and reenter bash or execute the following to get the new PATH in

```bash
source ~/.bashrc
```

#### wezterm

on Windows [zellij](https://zellij.dev/) multiplexer is not available

We recommend you install [wezterm](https://wezfurlong.org/wezterm/install/windows.html) instead

With that you can do the following to get started:

```bash
pnpm start:wezterm
```
