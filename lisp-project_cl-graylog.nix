
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-graylog-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-graylog/2016-02-08/cl-graylog-20160208-git.tgz";
        sha256 = "8225f99176883942664f31b3cf0c0a92840769cf822c8b49ed99d6294a8663dc";
      };
    }
