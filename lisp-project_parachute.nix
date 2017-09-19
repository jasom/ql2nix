
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parachute-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parachute/2017-08-30/parachute-20170830-git.tgz";
        sha256 = "a619059acae3fc0519a977bea5cc6983adc5a82121d0d7ce68cc3dc098feca42";
      };
    }
