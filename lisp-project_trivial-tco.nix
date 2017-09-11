
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-tco-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-tco/2013-10-03/trivial-tco-20131003-git.tgz";
        sha256 = "1f58320287b0892200354f55571876ad9f897efe3479cb02e8d90136fe512ff1";
      };
    }
