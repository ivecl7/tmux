{
  description = "My Nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall = {
      url = "github:snowfallorg/lib/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.snowfall.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall.namespace = "ivecl7";

      alias.packages.default = "tmux";
    };
}
