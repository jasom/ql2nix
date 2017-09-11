
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_http-get-cache-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/http-get-cache/2017-06-30/http-get-cache-20170630-git.tgz";
        sha256 = "2776c79325a9f6de2edbe22f09501659c9f3617ffa5cb1cf46614d01ab2cfe8d";
      };
    }
