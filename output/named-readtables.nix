
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-named-readtables";
      LD_LIBRARY_PATH = "";
      systemName = "named-readtables";
      lisp_dependencies = "";
      name = "named-readtables-20150923-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/named-readtables/2015-09-23/named-readtables-20150923-git.tgz";
        md5 = "43b5ef0f1b8e84a0feff1a96201a5dc1";
      };
    }
