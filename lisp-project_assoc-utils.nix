
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_assoc-utils-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/assoc-utils/2017-08-30/assoc-utils-20170830-git.tgz";
        sha256 = "22f490a42c95444c63d139a38f5dc0d87399c2bb45c06489dad9da4c57e46ccb";
      };
    }
