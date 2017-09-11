
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_listoflist-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/listoflist/2014-08-26/listoflist-20140826-git.tgz";
        sha256 = "9f873fac865cc5afeedf162f3be87b15aaf3a51aa53cde14a4ac18574fa6413b";
      };
    }
