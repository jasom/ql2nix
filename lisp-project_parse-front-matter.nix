
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-front-matter-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-front-matter/2016-08-25/parse-front-matter-20160825-git.tgz";
        sha256 = "f0b7dc3cfe91d4f80ddb94c76f727e097ff4598dda33c46dfb83f827558579f0";
      };
    }
