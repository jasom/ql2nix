
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fucc_0.2.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fucc/2011-01-10/fucc_0.2.1.tgz";
        sha256 = "1bcd8475f84b99d7a00fc8e55b81e1bac55c34268d865648c3ef5be62a59c043";
      };
    }
