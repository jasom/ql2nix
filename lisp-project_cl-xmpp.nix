
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-xmpp-0.8.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-xmpp/2010-10-06/cl-xmpp-0.8.1.tgz";
        sha256 = "a5e51a15e2f4fdcb8eab6d5a3b446e31b6e34336fda560b9a749bfca92fb0551";
      };
    }
