
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metatilities-base-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metatilities-base/2017-04-03/metatilities-base-20170403-git.tgz";
        sha256 = "799d8a3743660bb98bf517a22aae0c73269061fdf9e69214c3b679f3ee9f8191";
      };
    }
