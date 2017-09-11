
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_idna-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/idna/2012-01-07/idna-20120107-git.tgz";
        sha256 = "aca83a155272ba217fc9ae14316cf5b0000b19e4a2fe056e42ffe0b293923061";
      };
    }
