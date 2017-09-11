
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pp-toml-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pp-toml/2016-02-08/pp-toml-20160208-git.tgz";
        sha256 = "262062788cd71a5b96cf50e7770845f30483acbba0a9e0f911284a1e5432ddd7";
      };
    }
