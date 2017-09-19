
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_do-urlencode-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/do-urlencode/2017-08-30/do-urlencode-20170830-git.tgz";
        sha256 = "1690ffcd4e47c6c8adcedce6f428b3d99e45fd8eb96393c67501985f6bbe0495";
      };
    }
