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
          mtapi_shell_script =
            let
              app = final.mtapi.dependencyEnv;
            in
            prev.writeShellScript "start_mtapi_server" ''
              exec ${app}/bin/gunicorn \
                -w ''${NPROC:-$(${prev.coreutils}/bin/nproc)} \
                -b "''${HOST:-0.0.0.0}:''${PORT:-8080}" \
                "mtapi.app:create_app()"
            '';
          dockerImage = prev.dockerTools.buildImage {
            name = "mtapi-api-server";
            tag = "latest";
            config = {
              Cmd = [ "${final.mtapi_shell_script}" ];
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

        defaultPackage = pkgs.mtapi.dependencyEnv;

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            (python310.withPackages (ps: with ps; [ poetry ]))
          ];
        };
      }));
}
