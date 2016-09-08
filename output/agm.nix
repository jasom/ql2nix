{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, alexandria, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      buildInputs = [ sbcl asdf alexandria ];
      inherit stdenv;
      lisp_name = "sbcl-agm";
      systemName = "agm";
      lisp_dependencies = "${alexandria}";
      name = "agm-20160421-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/agm/2016-03-18/agm-20160318-git.tgz";
        sha256 = "7c6f29eb0cf0174944f230fdc969aca23b5b30401bcf10986d1b78d9e3ef126d";
      };
    }
