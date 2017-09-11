
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_introspect-environment-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/introspect-environment/2015-10-31/introspect-environment-20151031-git.tgz";
        sha256 = "6030be3586fe5c3a5565b6d24b8ecab13d58eb8e16f2e475b4a32e3dab6efe5a";
      };
    }
