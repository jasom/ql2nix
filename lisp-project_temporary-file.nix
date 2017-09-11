
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_temporary-file-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/temporary-file/2015-06-08/temporary-file-20150608-git.tgz";
        sha256 = "057f118f7f4e5a7f8f83be7d42b43535b9d172a2bb55d9908ebc359672962cb3";
      };
    }
