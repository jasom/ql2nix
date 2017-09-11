
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_common-doc-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/common-doc/2016-04-21/common-doc-20160421-git.tgz";
        sha256 = "c7b7030fcf3b783f3c4bc35c836fc6a6b99fdf1e7e5c82dfc01787e164114252";
      };
    }
