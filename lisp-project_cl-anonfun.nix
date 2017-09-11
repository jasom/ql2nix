
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-anonfun-20111203-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-anonfun/2011-12-03/cl-anonfun-20111203-git.tgz";
        sha256 = "35dc83ba49c6d3f561df66393ad3a050ab3e97fa1b837ff1ac3a10b5fcd8239b";
      };
    }
