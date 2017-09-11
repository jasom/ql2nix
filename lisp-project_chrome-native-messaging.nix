
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chrome-native-messaging-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chrome-native-messaging/2015-03-02/chrome-native-messaging-20150302-git.tgz";
        sha256 = "4f0867e0d1044ce3f9d1e32a131726dc3b46e798738b0cd2b0677e064b99454e";
      };
    }
