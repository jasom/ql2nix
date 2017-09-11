
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_md5-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/md5/2017-06-30/md5-20170630-git.tgz";
        sha256 = "ddc3c29843fecf1af5f39346ff91cebadcc4ffb61d3e64698acbcda90722915e";
      };
    }
