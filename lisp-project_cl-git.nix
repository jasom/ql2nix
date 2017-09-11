
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-git-20150709-git.git-threads-init.patch ./patches/lisp-project_cl-git-20150709-git.library-spec.patch];
      name = "lisp-project_cl-git-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-git/2015-07-09/cl-git-20150709-git.tgz";
        sha256 = "24a0b719c29913b347b77e420950975f4fa6e2ad2e5d64326fddb82d5c89d7a8";
      };
    }
