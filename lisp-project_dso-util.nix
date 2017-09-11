
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dso-util-0.1.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dso-util/2011-01-10/dso-util-0.1.2.tgz";
        sha256 = "2abfbe40a1cd1ab3d48f3771005e465ad21ed3b8a097eb13230e7e5d8c492fa7";
      };
    }
