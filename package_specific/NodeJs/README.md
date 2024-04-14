# Node Js

## Prerequisites

We will use NVM to install NodeJs
https://github.com/nvm-sh/nvm

## Installation

```bash
nvm install --lts
```

## Package Manager
My preferred package manager for Node is pnpm, it can be installed as specified in the [installation](https://pnpm.io/installation) link.
```bash
wget -qO- https://get.pnpm.io/install.sh | sh -
```

### Tweaking
To get a `npx` functionality we can use `pnpm dlx`. But we will create the following alias
```bash
alias pnpx='pnpm dlx'
```
