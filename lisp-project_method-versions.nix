
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_method-versions_0.1.2011.05.18";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/method-versions/2011-05-22/method-versions_0.1.2011.05.18.tgz";
        sha256 = "6bbeb90b5a5fed1712f65a307b4ab442269199b182016d084f5dfc0bae32c8d4";
      };
    }
