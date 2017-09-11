
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-slug-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-slug/2017-06-30/cl-slug-20170630-git.tgz";
        sha256 = "ebe2875bba7575c3fded8ce5edb230f1c35ac9f58118b6d1f813b63ec4fbd77f";
      };
    }
