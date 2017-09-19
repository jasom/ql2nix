
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_esrap-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/esrap/2017-08-30/esrap-20170830-git.tgz";
        sha256 = "134cdd069be534355dcbdfd10a2def6705c354441169beb86643dfffd21112f1";
      };
    }
