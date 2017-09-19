
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ntp-client-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ntp-client/2017-08-30/cl-ntp-client-20170830-git.tgz";
        sha256 = "1594773015849114133529829640e82af702321cfed53c3574deba25a5051261";
      };
    }
