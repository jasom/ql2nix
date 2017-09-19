
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-yesql-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-yesql/2017-08-30/cl-yesql-20170830-git.tgz";
        sha256 = "56cc42eba94f8a0f1dc8f81d41c1598ebcaf7a8dc1e90abe30f036f5234a4f5c";
      };
    }
