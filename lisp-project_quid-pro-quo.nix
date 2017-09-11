
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quid-pro-quo-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quid-pro-quo/2014-07-13/quid-pro-quo-20140713-git.tgz";
        sha256 = "13e962578027ed97bc06bebede9305d7f08587001bb97502d429bc9b06ce9a1c";
      };
    }
