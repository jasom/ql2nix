
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_macroexpand-dammit-20131111-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/macroexpand-dammit/2013-11-11/macroexpand-dammit-20131111-http.tgz";
        sha256 = "3e9a6884d2cb58ee61ae262adca299e5f90f13fd29ec4aae7dad9c3461eab635";
      };
    }
