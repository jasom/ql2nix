
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_apply-argv-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/apply-argv/2015-06-08/apply-argv-20150608-git.tgz";
        sha256 = "5dd21364a363cb7659beb4316dc767988d1bf2ac4ea1eedd809809a9e16953bc";
      };
    }
