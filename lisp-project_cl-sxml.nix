
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sxml-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sxml/2016-08-25/cl-sxml-20160825-git.tgz";
        sha256 = "4f54f4349f6964b01b6d7433dc14c5ca3ce7dfd5cf247e1881b8fc030ce573b0";
      };
    }
