
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_stealth-mixin-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/stealth-mixin/2017-06-30/stealth-mixin-20170630-git.tgz";
        sha256 = "72a6da39bde9278dc9376028ac867869d076c3c83d1fe3d4eec9eb8e39a45170";
      };
    }
