
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bt-semaphore-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bt-semaphore/2017-02-27/bt-semaphore-20170227-git.tgz";
        sha256 = "34bb52e8452c933086770cfe0e876dfeacaca0ed4b039aa361af3fefa38f4df7";
      };
    }
