
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_message-oo-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/message-oo/2013-06-15/message-oo-20130615-git.tgz";
        sha256 = "206ec461dff6254522ae154d8bf6d7a2ec766e757f56e39c96093c7217984502";
      };
    }
