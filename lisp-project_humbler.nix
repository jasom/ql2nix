
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_humbler-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/humbler/2017-08-30/humbler-20170830-git.tgz";
        sha256 = "efcdb23d14a1172838423d63c5185cb8dd138f6280dfb8653026d5a643254dbf";
      };
    }
