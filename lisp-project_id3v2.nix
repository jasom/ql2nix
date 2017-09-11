
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_id3v2-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/id3v2/2016-02-08/id3v2-20160208-git.tgz";
        sha256 = "f35aa30748390db2017b94f99a843eb9ce7b7c955330af7ccc218091b1036872";
      };
    }
