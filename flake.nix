{
  description = "Application packaged using poetry2nix";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.poetry2nix = {
    url = "github:nix-community/poetry2nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, poetry2nix }:
    {
      # Nixpkgs overlay providing the application
      overlay = nixpkgs.lib.composeManyExtensions [
        poetry2nix.overlay
        (final: prev: {
          # The application
          mtapi = prev.poetry2nix.mkPoetryApplication {
            projectDir = ./.;
            preferWheels = true;
          };
          dockerImage = prev.dockerTools.buildImage {
            name = "mtapi-api-server";
            tag = "latest";
            config = {
              Cmd = [ "${final.mtapi}/bin/app" ];
            };
          };
        })
      ];
    } // (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };
      in
      {
        packages = with pkgs; {
          inherit mtapi dockerImage;
        };

        defaultPackage = pkgs.mtapi;

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            (python310.withPackages (ps: with ps; [ poetry ]))
          ];
        };
      }));
}
