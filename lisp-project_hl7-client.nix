
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hl7-client-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hl7-client/2015-04-07/hl7-client-20150407-git.tgz";
        sha256 = "fb85ac44358591f6a04f328828a8cddfc4e541c8e01a6c5584dc4254519f81ac";
      };
    }
