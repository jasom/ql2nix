
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-xmlspam-20101006-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-xmlspam/2010-10-06/cl-xmlspam-20101006-http.tgz";
        sha256 = "7094a403facb9dafb642865f007961a496f1ec3fb0aa5b7a663647b29451a1d7";
      };
    }
