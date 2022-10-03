### Configure OSX

Install Xcode Command Line Tools:

```sh
xcode-select --install
```

Disable accent menu on long key press, globally

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Install Quick Look [plugins](https://github.com/sindresorhus/quick-look-plugins), preview app feature.

Install `Romanian - Programmers` keyboard layout:

```sh
curl --silent --location --max-redirs 10 https://raw.githubusercontent.com/SaltwaterC/romanian-programmers-mac/master/install.sh --output "/tmp/rpm-install.sh" && bash "/tmp/rpm-install.sh" && rm -f "/tmp/rpm-install.sh"
```

### Install development tools

Install `brew`:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install `pnpm`:

```sh
brew install pnpm
```

Install `node`, using `pnpm`'s [version manager](https://pnpm.io/cli/env):

```sh
pnpm env use -g latest
```

Install Rust and `cargo`, using [rustup](https://rustup.rs):

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Install `go`:

```sh
brew install go
```

### Useful CLI tools

[peco](https://github.com/peco/peco) – interactive filtering tool

```sh
brew install peco
```

[jq](https://github.com/stedolan/jq) – JSON processor

```sh
brew install jq
```

[httpie](https://github.com/httpie/httpie) – human-friendly HTTP client

```sh
brew install httpie
```

### Useful OSX apps

[lulu](https://www.objective-see.com/products/lulu.html) — a firewall to block unknown outgoing connections

[rectangle](https://rectangleapp.com/) — a windows manager, move and resize windows using keyboard shortcuts or snap areas
