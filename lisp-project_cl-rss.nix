
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rss-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rss/2015-09-23/cl-rss-20150923-git.tgz";
        sha256 = "125c1c1a80284f57adf3d7069be7cd094a14135e33d3c1b651d78c6b94751b4e";
      };
    }
