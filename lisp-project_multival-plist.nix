
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_multival-plist-20120305-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/multival-plist/2012-03-05/multival-plist-20120305-git.tgz";
        sha256 = "ae2c65684d8ea80ba3817bf6294a6ae453f2e1b48e168adb239bb8901517b511";
      };
    }
