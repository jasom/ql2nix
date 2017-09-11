
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_for-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/for/2017-06-30/for-20170630-git.tgz";
        sha256 = "42a6c4eec918a055a61714d61ab7b4747c62b3ee58bd4af73f23e5ea92dac664";
      };
    }
