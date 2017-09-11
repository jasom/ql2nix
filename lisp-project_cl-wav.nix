
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-wav-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-wav/2014-07-13/cl-wav-20140713-git.tgz";
        sha256 = "dad0ad548b798efe76e2976e584c6fcf022be83959856e819325d922bd691f09";
      };
    }
