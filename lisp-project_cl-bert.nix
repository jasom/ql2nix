
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bert-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bert/2014-11-06/cl-bert-20141106-git.tgz";
        sha256 = "0a57e42c25a7d55564269663c3fb1da4724d7dd7a912054330178192c3145a90";
      };
    }
