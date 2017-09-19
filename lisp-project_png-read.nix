
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_png-read-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/png-read/2017-08-30/png-read-20170830-git.tgz";
        sha256 = "7134803a7c1fc837bcdccfa0d827eaf0e94a66d8505679ec7b386be54353c391";
      };
    }
