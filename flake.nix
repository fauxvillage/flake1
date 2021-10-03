{
  description = "A flake for building 'Sup, dog?";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "sup";
        src = self;
        buildPhase = "gcc -o supdog ./sup.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin supdog";
      };

  };
}
