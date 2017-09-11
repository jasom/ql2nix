
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_utility-arguments-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/utility-arguments/2016-12-04/utility-arguments-20161204-git.tgz";
        sha256 = "696ffc469bcc4147b533b64b9f9fc36a05964c4b4e608cb230cb80eb91664582";
      };
    }
