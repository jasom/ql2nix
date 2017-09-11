
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_com-clearly-useful-protocols-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/com.clearly-useful.protocols/2013-03-12/com.clearly-useful.protocols-20130312-git.tgz";
        sha256 = "6b6329b356fc6f71efb8cb654a50475c250f2ea2bfca8af2fa8a3e96387a69f9";
      };
    }
