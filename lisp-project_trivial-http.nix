
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-http-20110219-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-http/2011-02-19/trivial-http-20110219-http.tgz";
        sha256 = "eba989b3b82ede420b9ec48cd2d13effb2d2fb98f9f070aa0fe8bc0b0a61eeaf";
      };
    }
