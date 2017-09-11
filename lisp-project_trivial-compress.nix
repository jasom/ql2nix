
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-compress-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-compress/2016-04-21/trivial-compress-20160421-git.tgz";
        sha256 = "34772485bcafb7fc690f2185152679a1e9851567c28320fc21bd65748c50cbc4";
      };
    }
