
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_docparser-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/docparser/2016-04-21/docparser-20160421-git.tgz";
        sha256 = "8ad3ec0394f6af67e1a4270bed453c224dc5731ac2f2caa44ddd6207c585d402";
      };
    }
