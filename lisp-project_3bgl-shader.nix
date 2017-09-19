
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3bgl-shader-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3bgl-shader/2017-08-30/3bgl-shader-20170830-git.tgz";
        sha256 = "1968d98bca92f3a8d55d0aa2a9487fc76017d4e86c24c82bbb478f36caead393";
      };
    }
