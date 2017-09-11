
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_spellcheck-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/spellcheck/2013-10-03/spellcheck-20131003-git.tgz";
        sha256 = "706eaae697ff74ceae1541a86dcbda764f4a3872fbce02740798e7b7a949c71b";
      };
    }
