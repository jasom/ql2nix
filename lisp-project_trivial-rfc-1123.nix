
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-rfc-1123-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-rfc-1123/2017-01-24/trivial-rfc-1123-20170124-git.tgz";
        sha256 = "99f1adc2880af8db57705cf3377848e64dd7d7ac30ad5401f0a6e535b15a4f6e";
      };
    }
