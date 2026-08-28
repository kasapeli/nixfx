Install:
```bash
nixos-install --flake github:kasapeli/nixfx#nix
```
On an existing system:
```bash
git clone https://www.github.com/kasapeli/nixfx.git (HTTPS)
git clone git@github:kasapeli/nixfx.git (SSH)
```

```bash
cd nixfx
sudo nixos-rebuild switch --flake .
```

Do not use the `hardware-configuration.nix` file provided, instead generate your own:
```bash
cd nixfx
sudo nixos-generate-config --root /mnt --dir . (New System)
sudo nixos-generate-config --dir . (On an existing system)
```

Showcase:

![Showcase Image](showcase.png)
