
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_umlisp-orf-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/umlisp-orf/2015-09-23/umlisp-orf-20150923-git.tgz";
        sha256 = "d44939239c17a25adbe20b3acfb95f29a07759ca04b8c579cf755c0ded5886c4";
      };
    }
