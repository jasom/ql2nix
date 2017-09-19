
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_papyrus-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/papyrus/2017-08-30/papyrus-20170830-git.tgz";
        sha256 = "6371bd56b8df4cabfeb13ab7c786443288c992c8c6ac6cbd2b092ac9a95eb468";
      };
    }
