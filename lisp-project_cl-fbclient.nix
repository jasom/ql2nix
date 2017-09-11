
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fbclient-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fbclient/2014-01-13/cl-fbclient-20140113-git.tgz";
        sha256 = "151a17da1109b4f918e0091361c4ec9da9e605d4803d4ac40f1370bc6d732d33";
      };
    }
