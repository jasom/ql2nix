
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weft-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weft/2017-02-27/weft-20170227-git.tgz";
        sha256 = "3d9bd01e170108bdda147b42c1d26e83a86f9987515dafd938ad3db507457098";
      };
    }
