
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jsonrpc-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jsonrpc/2017-08-30/jsonrpc-20170830-git.tgz";
        sha256 = "330c517e2e62ca9ff839bcee62ad805fa1a649562a62e682b503b59583dcb852";
      };
    }
