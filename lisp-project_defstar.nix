
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defstar-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defstar/2014-07-13/defstar-20140713-git.tgz";
        sha256 = "bf2a3eb465e8ff1c6813284b1a89d04f29c90f047a7437f5cd160752a75e179d";
      };
    }
