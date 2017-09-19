
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_helambdap-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/helambdap/2016-05-31/helambdap-20160531-git.tgz";
        sha256 = "251f5db90b80e6bb7f935d8c1466d32fa16bd1cae46120d17c0819fa56c87d7e";
      };
    }
