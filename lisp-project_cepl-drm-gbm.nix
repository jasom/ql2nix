
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-drm-gbm-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.drm-gbm/2016-12-04/cepl.drm-gbm-20161204-git.tgz";
        sha256 = "64d0c854e69c4ce294497a57edd9b47ecb4b4ac8ad00642d6c3f17eb9671afec";
      };
    }
