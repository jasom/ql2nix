
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bourbaki-20110110-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bourbaki/2011-01-10/bourbaki-20110110-http.tgz";
        sha256 = "d396e880ec2342e2bccf65269088a7ed263f931be601edc7bf96166a419aabb3";
      };
    }
