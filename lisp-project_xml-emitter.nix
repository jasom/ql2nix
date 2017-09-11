
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xml-emitter-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xml-emitter/2016-10-31/xml-emitter-20161031-git.tgz";
        sha256 = "3a778d86c20c3623ffce0d3240083187180bbfc46a52cd72f0f5033ff4be9a0a";
      };
    }
