
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_qmynd-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/qmynd/2017-06-30/qmynd-20170630-git.tgz";
        sha256 = "71199f944d1de8ff371185901c4a8ee723e31d93ed899fc62b2e054b6a162f07";
      };
    }
