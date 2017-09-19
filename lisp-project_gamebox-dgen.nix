
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gamebox-dgen-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gamebox-dgen/2017-08-30/gamebox-dgen-20170830-git.tgz";
        sha256 = "5810cb21eb881f1981cc94deb79716b050a45dc1f6e75d4afa0420bfb300aba5";
      };
    }
