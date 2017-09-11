
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rfc2388-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rfc2388/2013-07-20/rfc2388-20130720-git.tgz";
        sha256 = "6621172e3a6e1c4fb46360a345e25b0d075cb533aed0eb2e80debd45324bc9cf";
      };
    }
