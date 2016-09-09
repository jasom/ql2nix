
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-closer-mop";
      LD_LIBRARY_PATH = "";
      systemName = "closer-mop";
      lisp_dependencies = "";
      name = "closer-mop-20160825-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/closer-mop/2016-08-25/closer-mop-20160825-git.tgz";
        md5 = "4cee13b6703bf8883e3da0d869cd5da4";
      };
    }
