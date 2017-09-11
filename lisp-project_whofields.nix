
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_whofields-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/whofields/2017-06-30/whofields-20170630-git.tgz";
        sha256 = "4bb5dc92ac5a3c2dbe5f291f1cb08abd78a4576e5cedf16c19fd7c1d1a9ca5fa";
      };
    }
