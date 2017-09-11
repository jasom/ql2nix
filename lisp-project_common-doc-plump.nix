
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_common-doc-plump-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/common-doc-plump/2016-04-21/common-doc-plump-20160421-git.tgz";
        sha256 = "4c4f43e6e913d6103b7167d4aff47cddbfada13a81aad072a7b10be162096796";
      };
    }
