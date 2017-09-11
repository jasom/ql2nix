
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_gordon-20140713-git.deps.patch];
      name = "lisp-project_gordon-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gordon/2014-07-13/gordon-20140713-git.tgz";
        sha256 = "8389bab9700bf35b47d041c00e7aff96af07daaa9c1d2ff52be52232ba308df0";
      };
    }
