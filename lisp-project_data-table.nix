
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_data-table-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/data-table/2016-02-08/data-table-20160208-git.tgz";
        sha256 = "f521280280ff319d4bddb8762619e79ca0f83c55ad21320a8f3f84dee598f277";
      };
    }
