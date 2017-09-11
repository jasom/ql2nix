
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_postmodern-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/postmodern/2017-04-03/postmodern-20170403-git.tgz";
        sha256 = "37edfb43fc73a25a482ed5b7adb4a2fad1cc726ee950da57cd5439e0c1ad74de";
      };
    }
