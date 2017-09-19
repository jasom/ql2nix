
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_spinneret-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/spinneret/2017-08-30/spinneret-20170830-git.tgz";
        sha256 = "c88528b7c58a5716b531780edafb310bada622597b62ab9cdd712fb83589697b";
      };
    }
