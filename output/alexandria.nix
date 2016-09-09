
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-alexandria";
      LD_LIBRARY_PATH = "";
      systemName = "alexandria";
      lisp_dependencies = "";
      name = "alexandria-20160825-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/alexandria/2016-08-25/alexandria-20160825-git.tgz";
        md5 = "9eb868ea171d8a7707b0c9accee8a91f";
      };
    }