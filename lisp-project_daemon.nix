
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_daemon-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/daemon/2017-04-03/daemon-20170403-git.tgz";
        sha256 = "3cde0696ba9cdf36c6d74d07a607c978f6c7e314afa3c4e06df4f48514aa386a";
      };
    }
