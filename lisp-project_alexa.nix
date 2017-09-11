
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_alexa-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/alexa/2017-01-24/alexa-20170124-git.tgz";
        sha256 = "b8b360e36d43c81e2164674faf2dbce84ee80620b6b14a5a6e034245b951cfce";
      };
    }
