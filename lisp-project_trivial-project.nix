
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-project-quicklisp-9e3fe231-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-project/2017-08-30/trivial-project-quicklisp-9e3fe231-git.tgz";
        sha256 = "3ef36e5588abeec817bddd7524b0e8b7106d336c692f8af8c78d7784e91d343b";
      };
    }
