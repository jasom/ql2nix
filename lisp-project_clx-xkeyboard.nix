
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clx-xkeyboard-20120811-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clx-xkeyboard/2012-08-11/clx-xkeyboard-20120811-git.tgz";
        sha256 = "1615420e38347c39b42785cd009079d0b46eefb7142351e6cec7f6d173030787";
      };
    }
