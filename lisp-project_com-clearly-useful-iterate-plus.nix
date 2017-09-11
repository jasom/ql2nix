
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_com-clearly-useful-iterate-plus-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/com.clearly-useful.iterate-plus/2012-10-13/com.clearly-useful.iterate-plus-20121013-git.tgz";
        sha256 = "c82f378a490a42050ee0b141f6515b4dc085927b954272ec57d8dfe6a781559f";
      };
    }
