
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-backtrace-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-backtrace/2016-05-31/trivial-backtrace-20160531-git.tgz";
        sha256 = "1df68d7d0f4a9611e5470cdacae58d594b26cc63b223e89fd85152b119559bed";
      };
    }
