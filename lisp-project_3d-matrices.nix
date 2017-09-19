
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3d-matrices-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3d-matrices/2017-08-30/3d-matrices-20170830-git.tgz";
        sha256 = "4daf64cc005c7dd66082be624eebc269331337722d9f00c67622e4b4271ccb30";
      };
    }
