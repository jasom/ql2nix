
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xsubseq-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xsubseq/2015-01-13/xsubseq-20150113-git.tgz";
        sha256 = "b8e888deb3b311991158e2302017df1a1ed0edb31bc3ef01a89ce1794f84727a";
      };
    }
