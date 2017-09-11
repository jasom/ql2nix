
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-flowd-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-flowd/2014-07-13/cl-flowd-20140713-git.tgz";
        sha256 = "be76a43b64f6f9741cdbb5c59600bcaa6ba29e718334ee19c94925fbe117e2ec";
      };
    }
