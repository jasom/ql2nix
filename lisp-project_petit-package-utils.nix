
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_petit-package-utils-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/petit.package-utils/2014-08-26/petit.package-utils-20140826-git.tgz";
        sha256 = "580602847557c644a812ffa6ba7b92d43d6389bdfc231f71ef7c2e153b97bf52";
      };
    }
