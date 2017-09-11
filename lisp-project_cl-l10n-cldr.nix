
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-l10n-cldr-20120909-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-l10n-cldr/2012-09-09/cl-l10n-cldr-20120909-darcs.tgz";
        sha256 = "3bae7f7a291707442184f78494617d841e320925032a0cf8e77fff88fa0a880e";
      };
    }
