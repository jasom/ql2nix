
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lichat-ws-server-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lichat-ws-server/2017-08-30/lichat-ws-server-20170830-git.tgz";
        sha256 = "31a15a38e7304c23da2b9a764b33b6292d5dcfb187eca193ecf6ca3a6ab7b6fb";
      };
    }
