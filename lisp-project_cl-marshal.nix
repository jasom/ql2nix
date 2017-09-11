
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-marshal-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-marshal/2017-01-24/cl-marshal-20170124-git.tgz";
        sha256 = "8d1883678ed5e09adf914f467f1118c9ccd43a44a5f6b598238cd0abe5a8837c";
      };
    }
