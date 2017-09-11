
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_toadstool-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/toadstool/2013-06-15/toadstool-20130615-git.tgz";
        sha256 = "f3f40ac4f5c7000b6c3ea235bc2c1bff01da196c2829919d929a7ccc108f49b4";
      };
    }
