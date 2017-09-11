
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_antik-master-ad6432e3-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/antik/2016-02-08/antik-master-ad6432e3-git.tgz";
        sha256 = "e81120bf448666634c36e0f455e46663737ba4a58314d45fec1ab997ce777239";
      };
    }
