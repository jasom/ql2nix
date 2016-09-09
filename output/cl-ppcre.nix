
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-cl-ppcre";
      LD_LIBRARY_PATH = "";
      systemName = "cl-ppcre";
      lisp_dependencies = "";
      name = "cl-ppcre-2.0.11";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ppcre/2015-09-23/cl-ppcre-2.0.11.tgz";
        md5 = "6d5250467c05eb661a76d395186a1da0";
      };
    }
