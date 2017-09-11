
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-apple-plist-20111105-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-apple-plist/2011-11-05/cl-apple-plist-20111105-git.tgz";
        sha256 = "23bf2311db564182307738487cf40bee0f9acf54a8e4ead95a6a24b1cab636f2";
      };
    }
