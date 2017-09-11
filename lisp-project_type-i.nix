
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_type-i-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/type-i/2015-06-08/type-i-20150608-git.tgz";
        sha256 = "cbe498ae8d11582b3a1a57317bf5a71e49419cf1b6c0ca408fa95c39bd1418cf";
      };
    }
