
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_l-system-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/l-system/2017-06-30/l-system-20170630-git.tgz";
        sha256 = "4ff536e1f14f46e407a53996b28519a1c0feae8fcdda634cf4681ab102807001";
      };
    }
