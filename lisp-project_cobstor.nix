
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cobstor-20150207T212348";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cobstor/2015-03-02/cobstor-20150207T212348.tgz";
        sha256 = "3f03db2264f16173959dec10272074648f62506942d9f573d0662a3f65d85f85";
      };
    }
