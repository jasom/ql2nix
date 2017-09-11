
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_proc-parse-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/proc-parse/2016-03-18/proc-parse-20160318-git.tgz";
        sha256 = "d466837bff4d54c841b47fbc10955ed29294d08308ea91cd832cf164040f4600";
      };
    }
