
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mailbox-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mailbox/2013-10-03/mailbox-20131003-git.tgz";
        sha256 = "fbf7c31a09248bf31388bf3bf6370e6304f80e5493b6297d70d5465b791a438a";
      };
    }
