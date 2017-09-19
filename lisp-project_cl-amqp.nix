
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-amqp-v0.4.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-amqp/2016-03-18/cl-amqp-v0.4.1.tgz";
        sha256 = "feb15ce1c17bb3c2f24a2c64077895a21c17fa253f150e32ec7ea2ef70cb5c45";
      };
    }
