
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_vas-string-metrics-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/vas-string-metrics/2016-02-08/vas-string-metrics-20160208-git.tgz";
        sha256 = "901d8838b0046a77cae7812e58fe8ef272d6f52379d16ab2b47345c1de4a2ae9";
      };
    }
