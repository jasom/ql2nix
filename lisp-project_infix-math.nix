
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_infix-math-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/infix-math/2017-08-30/infix-math-20170830-git.tgz";
        sha256 = "9282b399f4736a2780f682f68af0fa3f76f3e94ef8bb14ee6b01a779eb527ae9";
      };
    }
