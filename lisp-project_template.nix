
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_template-20150113-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/template/2015-01-13/template-20150113-hg.tgz";
        sha256 = "38e74bdcd7416da3a53b234e718f9b40cb3368565db2bb6bad2dde99ccbd4edb";
      };
    }
