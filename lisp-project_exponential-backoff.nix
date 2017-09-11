
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_exponential-backoff-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/exponential-backoff/2015-01-13/exponential-backoff-20150113-git.tgz";
        sha256 = "94717594f93e6e1fb31042d16db8cea41f817d732fb4a00ac49389632ecbac05";
      };
    }
