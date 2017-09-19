
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_configuration-options-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/configuration.options/2017-08-30/configuration.options-20170830-git.tgz";
        sha256 = "04de59e86752b781ab926b3c4dc0efa46cef05cb92f87bb89309ad79d4e5c717";
      };
    }
