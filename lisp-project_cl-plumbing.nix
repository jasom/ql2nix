
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-plumbing-20120703-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-plumbing/2012-07-03/cl-plumbing-20120703-git.tgz";
        sha256 = "59dc4a87dabf9671ed2630658e933cfa85436123df31ae8b75459470902f37dd";
      };
    }
