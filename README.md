# Probably don't use this

[This Project](https://github.com/0xc000022070/zen-browser-flake) is waaay better. Use this instead.
Will probably archive in favor of this eventually.

# Zen Browser

This is a flake for the Zen browser.

Just add it to your NixOS `flake.nix` or home-manager:

```nix
inputs = {
  zen-browser.url = "github:HirschBerge/zen-browser-flake";
  ...
}
```

## Packages

This flake exposes two packages, corresponding to the `aarch64` and `x86` zen versions.

The `default` package is the `aarch64` one for backwards compatibility with older versions of the flake.

Then in the `configuration.nix` in the `environment.systemPackages` add one of:

```nix
inputs.zen-browser.packages."${system}".default
inputs.zen-browser.packages."${system}".aarch64
inputs.zen-browser.packages."${system}".x86
```

Depending on which version you want

```shell
$ sudo nixos-rebuild switch
$ zen
```

## 1Password

Zen has to be manually added to the list of browsers that 1Password will communicate with. See [this wiki article](https://nixos.wiki/wiki/1Password) for more information. To enable 1Password integration, you need to add the line `.zen-wrapped` to the file `/etc/1password/custom_allowed_browsers`.
