
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fare-csv-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fare-csv/2015-12-18/fare-csv-20151218-git.tgz";
        sha256 = "e94e1163cbf784893e66116411ed6077be6bf76eb30c05faeaf173ddac9a2ecc";
      };
    }
