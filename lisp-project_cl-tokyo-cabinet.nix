
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tokyo-cabinet-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tokyo-cabinet/2016-08-25/cl-tokyo-cabinet-20160825-git.tgz";
        sha256 = "484edf3175c47dbe93fd97aff85dbb20c12c5966c6cb02691684c65c7aaf18b1";
      };
    }
