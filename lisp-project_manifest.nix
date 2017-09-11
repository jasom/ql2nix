
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_manifest-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/manifest/2012-02-08/manifest-20120208-git.tgz";
        sha256 = "fc7457b51736d99465a0b362cbb526521462af5b1eebc74dbc0c18144bc4a008";
      };
    }
