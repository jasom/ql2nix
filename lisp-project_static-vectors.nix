
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_static-vectors-v1.8.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/static-vectors/2017-01-24/static-vectors-v1.8.2.tgz";
        sha256 = "2fa8ec9928be0107292ae8f6d178afd352db97be3c6eda6b5d866c9b3970655c";
      };
    }
