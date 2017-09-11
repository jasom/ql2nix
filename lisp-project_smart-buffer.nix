
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_smart-buffer-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/smart-buffer/2016-06-28/smart-buffer-20160628-git.tgz";
        sha256 = "3aaca8161c9cddd54f15e93eaec07573fcdf02b6ced21e924de32036ad06e5f2";
      };
    }
