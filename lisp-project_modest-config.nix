
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modest-config-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modest-config/2017-06-30/modest-config-20170630-git.tgz";
        sha256 = "6fd44d4012e3d06049eabc862b913daf1578ebc88bde0626f4af81e93aa917de";
      };
    }
