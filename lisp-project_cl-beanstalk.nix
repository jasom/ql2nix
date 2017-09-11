
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-beanstalk-20110619-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-beanstalk/2011-06-19/cl-beanstalk-20110619-git.tgz";
        sha256 = "f552a700fcdbb6841a941c5d181752c89de8d00f630f8b04e8c39114b1fa74fb";
      };
    }
