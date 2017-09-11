
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-epoch-20120811-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-epoch/2012-08-11/cl-epoch-20120811-git.tgz";
        sha256 = "ea7189804f3a9b63b6bc83c831412eaa864cabeb08d94542af11b28083345841";
      };
    }
