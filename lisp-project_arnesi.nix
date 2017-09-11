
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_arnesi-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/arnesi/2017-04-03/arnesi-20170403-git.tgz";
        sha256 = "041b2d32bcaa3fc214ef16bf3c2acefc70491a1ddc66d91b5bef96fdaecc7106";
      };
    }
