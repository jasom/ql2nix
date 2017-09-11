
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-json-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-json/2017-06-30/monkeylib-json-20170630-git.tgz";
        sha256 = "f7b4fad9f2974b17c211c89b86e34f620f20eba4606cff21ac434dbc3dcaab19";
      };
    }
