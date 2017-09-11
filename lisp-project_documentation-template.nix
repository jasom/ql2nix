
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_documentation-template-0.4.4.require.patch];
      name = "lisp-project_documentation-template-0.4.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/documentation-template/2014-12-17/documentation-template-0.4.4.tgz";
        sha256 = "5982b1daf02d1fa032680a338ad027eb241aa1b4663ae59fba9d121a99e93c41";
      };
    }
