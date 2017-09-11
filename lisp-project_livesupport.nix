
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_livesupport-release-quicklisp-00889dc6-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/livesupport/2017-06-30/livesupport-release-quicklisp-00889dc6-git.tgz";
        sha256 = "d1610ea6a5f80dae8ab6baea1fffdf8c7c8330fd442b777818d7a85c8715a639";
      };
    }
