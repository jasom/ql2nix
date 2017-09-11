
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_string-escape-20150407-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/string-escape/2015-04-07/string-escape-20150407-http.tgz";
        sha256 = "8eb0e73325935c62f637ec89b9e2e5547d4eb8c76838a5cef43d0a15b60a8fca";
      };
    }
