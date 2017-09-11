
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gss-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gss/2017-02-27/cl-gss-20170227-git.tgz";
        sha256 = "4902b7aaafe594c5e94d124602a68a2c5cec04e0aaec7dd5e57e259d48d24368";
      };
    }
