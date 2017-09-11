
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_zip-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/zip/2015-06-08/zip-20150608-git.tgz";
        sha256 = "92ea378507ff064cfa7994e0ae4bacd1a026e57257e1157d48a126872035e20b";
      };
    }
