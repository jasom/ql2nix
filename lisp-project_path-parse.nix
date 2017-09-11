
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_path-parse-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/path-parse/2016-04-21/path-parse-20160421-git.tgz";
        sha256 = "845404f5be87d7f93a9b4a6af033bd1ddc1313abd2bbf41996181430db69b605";
      };
    }
