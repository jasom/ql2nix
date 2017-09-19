
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-lastfm-0.2.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-lastfm/2014-07-13/cl-lastfm-0.2.1.tgz";
        sha256 = "dd9d812de637e24a6fced5b512b4ee5e4e842b457a051d837fa4744affa78f5e";
      };
    }
