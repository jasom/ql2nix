
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-geometry-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-geometry/2016-05-31/cl-geometry-20160531-git.tgz";
        sha256 = "f768f3d430f0596606a11fb96e3defc0222bac2c75dc3745db94a6de040f856c";
      };
    }
