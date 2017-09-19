
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cheat-js-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cheat-js/2012-10-13/cheat-js-20121013-git.tgz";
        sha256 = "2133375d1e53768a90f07320c6c0a79306282d39c6d8c59d1dff9ce9ddf5c48d";
      };
    }
