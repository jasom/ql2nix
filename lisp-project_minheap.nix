
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_minheap-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/minheap/2016-06-28/minheap-20160628-git.tgz";
        sha256 = "ffc3a89a131ba851212e02fb7a5116861fb7058c1c1775b21d8efbab77ec55fe";
      };
    }
