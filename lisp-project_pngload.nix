
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pngload-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pngload/2017-08-30/pngload-20170830-git.tgz";
        sha256 = "30fd1f0f4b8dece5e94a8e8168f07864a4f06424226040aac53b19793225afb2";
      };
    }
