
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clim-widgets-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clim-widgets/2017-06-30/clim-widgets-20170630-git.tgz";
        sha256 = "73daf79b27146414f0c4ccf4b72f77eeb5979a49db35a4fac02032870583ee0e";
      };
    }
