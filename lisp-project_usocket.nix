
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_usocket-0.7.0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/usocket/2016-10-31/usocket-0.7.0.1.tgz";
        sha256 = "c2454e8d8f65bf81aadf877d65d9b6364ed25f8560ad405063e2b4bfb872ecd6";
      };
    }
