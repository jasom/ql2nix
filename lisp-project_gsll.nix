
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gsll-quicklisp-dd2e7673-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gsll/2017-01-24/gsll-quicklisp-dd2e7673-git.tgz";
        sha256 = "dd2580d961c8dcb503e3e65bd20099cbb54456077de85f5326d3093825c36f15";
      };
    }
