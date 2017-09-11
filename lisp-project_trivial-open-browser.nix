
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-open-browser-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-open-browser/2016-08-25/trivial-open-browser-20160825-git.tgz";
        sha256 = "51c915b15ef4010a629da59085c6ca239e8ff0e5d4bfe65942fe5b746e38493e";
      };
    }
