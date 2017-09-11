
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fare-memoization-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fare-memoization/2017-06-30/fare-memoization-20170630-git.tgz";
        sha256 = "84f708792b6e64bc7af6c7a81283e0cca5fea6b0e8c8373ab1ccd6b3c4556f26";
      };
    }
