
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pdf-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pdf/2017-07-25/cl-pdf-20170725-git.tgz";
        sha256 = "abe84c5e8311ecb77f22f813297be48153228b4f34998d435069710473f7a97a";
      };
    }
