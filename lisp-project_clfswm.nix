
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clfswm-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clfswm/2016-12-04/clfswm-20161204-git.tgz";
        sha256 = "e3dccb048a3d9b222ed410d097e0df04f857c66076868ac766af05718e08ffc9";
      };
    }
