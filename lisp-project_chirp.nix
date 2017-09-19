
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chirp-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chirp/2017-08-30/chirp-20170830-git.tgz";
        sha256 = "bbf4bbee45df2eea90b0239eb4f49302edfaec6fbd86f1ee4d698ac14b860307";
      };
    }
