
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_text-query-1.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/text-query/2011-11-05/text-query-1.1.tgz";
        sha256 = "8c47b8afde9d15e5294dd91204a0cb23b863ca7cb23197ff32438766573331f7";
      };
    }
