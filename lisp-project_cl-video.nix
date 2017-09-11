
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-video-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-video/2017-06-30/cl-video-20170630-git.tgz";
        sha256 = "ca469ac6b4c29f066aef01583cc66066c86e065c7efa779a081352d11ffcc66e";
      };
    }
