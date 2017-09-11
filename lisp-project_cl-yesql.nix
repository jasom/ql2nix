
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-yesql-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-yesql/2017-07-25/cl-yesql-20170725-git.tgz";
        sha256 = "94a380644c2f4e2316fbf4891bfc18301d438ec588ef2af45400ef38bcd3c459";
      };
    }
