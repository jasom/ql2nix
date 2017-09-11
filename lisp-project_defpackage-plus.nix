
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defpackage-plus-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defpackage-plus/2016-06-28/defpackage-plus-20160628-git.tgz";
        sha256 = "c13ea3d4a57ec50266e5fd3b4a5abd3e573072512a752dc6d38eaf9867bd13c2";
      };
    }
