
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sip-hash-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sip-hash/2016-08-25/sip-hash-20160825-git.tgz";
        sha256 = "519f13e817c70bc5e8f43e7f2a83288701be7d6d5adce9b9a5b49577588aa5b6";
      };
    }
