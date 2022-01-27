## dotfiles

Minimal shell setup based on `zsh`.

### Install dotfiles:

```
curl https://raw.githubusercontent.com/navaru/dotfiles/main/install.sh | bash
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

### OSX notes

Disable accent menu on long key press, globally

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Install `Romanian - Programmers` keyboard layout:

```sh
curl --silent --location --max-redirs 10 https://raw.githubusercontent.com/SaltwaterC/romanian-programmers-mac/master/install.sh --output "/tmp/rpm-install.sh" && bash "/tmp/rpm-install.sh" && rm -f "/tmp/rpm-install.sh"
```

Install Quick Look [plugins](https://github.com/sindresorhus/quick-look-plugins), Preview app feature.


Useful apps:

- [lulu](https://www.objective-see.com/products/lulu.html) — a firewall to block unknown outgoing connections
- [rectangle](https://rectangleapp.com/) — a windows manager, move and resize windows using keyboard shortcuts or snap areas
