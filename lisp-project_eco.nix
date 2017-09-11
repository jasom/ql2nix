
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eco-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eco/2015-06-08/eco-20150608-git.tgz";
        sha256 = "4ab93776ddbe3fb5190014218baabd35cfa5a837ea8410392838ae0ea1c3e62f";
      };
    }
