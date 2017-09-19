
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sanitized-params-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sanitized-params/2017-08-30/sanitized-params-20170830-git.tgz";
        sha256 = "a790b4bd3cc88f03c16b40b00383de8bc6bf461776f90fe3598dd1763cf57f65";
      };
    }
