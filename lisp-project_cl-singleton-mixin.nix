
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-singleton-mixin-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-singleton-mixin/2015-05-05/cl-singleton-mixin-20150505-git.tgz";
        sha256 = "3752769b11d65767ed6daff02540a27c3a90329169c920e9a0810e805b7b06fe";
      };
    }
