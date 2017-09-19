
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_drakma-async-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/drakma-async/2015-10-31/drakma-async-20151031-git.tgz";
        sha256 = "134a796d3257434c835cb12fe750d15f8bc3ae9edf6f9249e4c4687a846e1574";
      };
    }
