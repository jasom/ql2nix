
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-html5-parser-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-html5-parser/2017-06-30/cl-html5-parser-20170630-git.tgz";
        sha256 = "b4e0084e7174ae7c25ae18cde9641f2cc1bf4878e67cbf4ffb6fbf8ec4157e3a";
      };
    }
