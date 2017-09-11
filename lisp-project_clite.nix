
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clite-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clite/2013-06-15/clite-20130615-git.tgz";
        sha256 = "1e756bb4bf5036bc7e7224a432de544888429b8b0963e79e8d5e7ad26429ec95";
      };
    }
