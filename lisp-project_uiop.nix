
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_uiop-3.2.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/uiop/2017-06-30/uiop-3.2.1.tgz";
        sha256 = "bbb8fa413d23d8236b89ecbb5a9beba9cc3c8d21494a57a8a7acbc355b3086fe";
      };
    }
