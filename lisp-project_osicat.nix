
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_osicat-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/osicat/2016-08-25/osicat-20160825-git.tgz";
        sha256 = "467e12dd7cf1b40c15a262f85b34d8e6a9a4b4843703e4842798e0010649a866";
      };
    }
