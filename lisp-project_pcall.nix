
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pcall-0.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pcall/2010-10-06/pcall-0.3.tgz";
        sha256 = "3e8cb3347fa262882572b52c705e00884b8b964e27402ba803e7a46d79e82d0a";
      };
    }
