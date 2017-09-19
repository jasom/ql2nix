
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_json-streams-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/json-streams/2017-08-30/json-streams-20170830-git.tgz";
        sha256 = "b92f595261110a8a62f113067a1d7c3386436ff23e9f0d2fbe1c3fa9b8e3ff79";
      };
    }
