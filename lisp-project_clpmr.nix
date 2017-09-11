
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clpmr-20150207T212625";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clpmr/2015-03-02/clpmr-20150207T212625.tgz";
        sha256 = "1dee9f6aab82506a30dfa7a1e95665068e149d17ac1ecffb76262432fbc09c7b";
      };
    }
