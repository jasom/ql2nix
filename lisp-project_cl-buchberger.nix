
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-buchberger-20110522-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-buchberger/2011-05-22/cl-buchberger-20110522-git.tgz";
        sha256 = "05e5dee912be90ee5c6e2095223aabb7f5376e2453d4edee3e19e2fc68e1a121";
      };
    }
