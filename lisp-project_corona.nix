
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_corona-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/corona/2016-08-25/corona-20160825-git.tgz";
        sha256 = "17caa64ae7a016695b013e23908253a13cb24a9a42182f0c3cc662e92d51c58c";
      };
    }
