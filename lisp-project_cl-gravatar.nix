
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gravatar-20110320-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gravatar/2011-03-20/cl-gravatar-20110320-git.tgz";
        sha256 = "c13fa91ab74bc959b8bc6c4a076dc63248bc778ea5bb8a6269d4790036712d27";
      };
    }
