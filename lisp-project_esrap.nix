
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_esrap-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/esrap/2017-06-30/esrap-20170630-git.tgz";
        sha256 = "b08769db4ca71a3b25db32c6bcc9b7144e13570eea2f1fd903d98f354b81579c";
      };
    }
