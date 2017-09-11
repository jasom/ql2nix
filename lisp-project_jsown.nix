
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jsown-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jsown/2016-02-08/jsown-20160208-git.tgz";
        sha256 = "5183cef0ae03db4c124b10050646266682dcc701cc0537edbd9e25bdc2144400";
      };
    }
