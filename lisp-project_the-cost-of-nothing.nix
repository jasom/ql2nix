
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_the-cost-of-nothing-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/the-cost-of-nothing/2017-06-30/the-cost-of-nothing-20170630-git.tgz";
        sha256 = "1fd2e346c4f1067255b5c1a5464537daed25116704722dec2cb6c228bcc4b346";
      };
    }
