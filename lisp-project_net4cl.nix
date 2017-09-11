
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_net4cl-20150207T212000";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/net4cl/2015-03-02/net4cl-20150207T212000.tgz";
        sha256 = "f2b1b6793bca550ba4a9a241f4c4c747b43885a1bc1488d152b76414dffa3599";
      };
    }
