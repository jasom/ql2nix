
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_vector-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/vector/2013-01-28/vector-20130128-git.tgz";
        sha256 = "1c24a6972d6c66500ee1465a89e99f8193b24cd1f20c0afc82202545fb3cdc77";
      };
    }
