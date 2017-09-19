
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_buildnode-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/buildnode/2017-04-03/buildnode-20170403-git.tgz";
        sha256 = "6671deb6b0d51992efd3068f44c60bd6d113c14f696db837d3318c47aefe63bd";
      };
    }
