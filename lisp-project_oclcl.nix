
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_oclcl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/oclcl/2017-06-30/oclcl-20170630-git.tgz";
        sha256 = "8d64c98542aa33f2c376d916211aabe3b90f852fb93897797812c7083adb70b4";
      };
    }
