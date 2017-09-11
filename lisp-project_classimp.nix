
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_classimp-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/classimp/2017-06-30/classimp-20170630-git.tgz";
        sha256 = "5fa1916fae2b928d1e65d4b18716ae89db2dcbc2cd39ee2967d82cc866b24cec";
      };
    }
