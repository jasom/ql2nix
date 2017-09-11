
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_conium-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/conium/2014-07-13/conium-20140713-git.tgz";
        sha256 = "872a1f8243293884199c41b095aad9a885fb9f789f5cffd37a809b341acab6a4";
      };
    }
