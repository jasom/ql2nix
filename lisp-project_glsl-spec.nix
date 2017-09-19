
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glsl-spec-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glsl-spec/2017-08-30/glsl-spec-20170830-git.tgz";
        sha256 = "2f9ad3f7ea0ecd6177df1da1a5c79cc96b475e02ffb1c8851e783375b3bb6f9c";
      };
    }
