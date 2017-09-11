
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_do-urlencode-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/do-urlencode/2013-07-20/do-urlencode-20130720-git.tgz";
        sha256 = "aa8f7ffb5d0a53fc6a17d68351d893176dd6841d8ba4e46fb6878bc230cf84a6";
      };
    }
