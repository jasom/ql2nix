{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  stdenv = pkgs.stdenv;
  #callPackage = pkgs.lib.callPackageWith (pkgs // self);
  buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
  self = {
    inherit (pkgs) fetchurl;
    buildInputs = [ pkgs.sbcl pkgs.asdf ];
    alexandria = buildLispPackage rec {
      inherit stdenv;
      lisp_name = "sbcl-alexandria";
      systemName = "alexandria";
      name = "alexandria-20160421-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/alexandria/2016-04-21/alexandria-20160421-git.tgz";
        sha256 = "59e95780b35d0ebea7530564c4d18cafa0a1118aaa109ae6c2dcffbbed28f686";
      };
    };
  }; in self
