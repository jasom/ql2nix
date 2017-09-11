
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-clipboard-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-clipboard/2017-06-30/trivial-clipboard-20170630-git.tgz";
        sha256 = "628a3b63bd17a4c4d6c9d7f68567c8a460a3539c3050e60b53059da1bf7974d3";
      };
    }
