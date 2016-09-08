{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  helpers = { buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl; };

  callPackage = pkgs.lib.callPackageWith (pkgs // helpers // self);

  self = {
    alexandria = callPackage ./alexandria2.nix { };

    agm = callPackage ./agm.nix { };

    #gpm = callPackage ./pkgs/gpm { };

    #mc = callPackage ./pkgs/mc { };
  };
in
  self
