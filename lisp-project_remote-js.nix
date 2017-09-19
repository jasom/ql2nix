
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_remote-js-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/remote-js/2016-08-25/remote-js-20160825-git.tgz";
        sha256 = "383b131a44715bcdc0bcea9865fd04f219154b078ed7d8a86d576332eb8dc8e1";
      };
    }
