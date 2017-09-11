
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clx-xembed-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clx-xembed/2012-09-09/clx-xembed-20120909-git.tgz";
        sha256 = "6bd14ce4f59823e5c5ab9171adb406530066ddf9679637ef8a59834541ab021a";
      };
    }
