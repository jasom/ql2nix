
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_restas-directory-publisher-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/restas-directory-publisher/2013-01-28/restas-directory-publisher-20130128-git.tgz";
        sha256 = "98b49f3472b39b0b71da5272bad74e5799e8d3824b77b49e5781f792cd6041ac";
      };
    }
