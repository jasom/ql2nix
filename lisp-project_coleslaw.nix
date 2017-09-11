
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_coleslaw-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/coleslaw/2017-07-25/coleslaw-20170725-git.tgz";
        sha256 = "225d4a017f36aa5f2fe5c7f16233dac087a3530ac99abe082ddbe8fd92a88a6a";
      };
    }
