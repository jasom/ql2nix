
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_com-clearly-useful-iterator-protocol-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/com.clearly-useful.iterator-protocol/2013-03-12/com.clearly-useful.iterator-protocol-20130312-git.tgz";
        sha256 = "17bbf4a499a1c4a9dd2892c08ad4f9020f501cdbb120110af8bf23780c86d0ec";
      };
    }
