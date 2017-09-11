
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mexpr-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mexpr/2015-07-09/mexpr-20150709-git.tgz";
        sha256 = "3516abdeccdf2fbbe66f7a3e075d24747b04f4833ae7f98454b60e0f2708d28c";
      };
    }
