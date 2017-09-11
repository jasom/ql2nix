
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_prbs-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/prbs/2017-06-30/prbs-20170630-git.tgz";
        sha256 = "3a102559fd54073bcddc455bb9be18a3e931c63ce9222b9bd7ed7e1d54d52597";
      };
    }
