
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chtml-matcher-20111001-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chtml-matcher/2011-10-01/chtml-matcher-20111001-git.tgz";
        sha256 = "160105a4ddf6fa1cc01c0020903455139b5375151057c90686af38368fa35c5c";
      };
    }
