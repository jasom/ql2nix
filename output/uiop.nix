
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-uiop";
      LD_LIBRARY_PATH = "";
      systemName = "uiop";
      lisp_dependencies = "";
      name = "uiop-3.1.6";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/uiop/2015-10-31/uiop-3.1.6.tgz";
        md5 = "b5592abf39009e55ceeac72bc80210f2";
      };
    }
