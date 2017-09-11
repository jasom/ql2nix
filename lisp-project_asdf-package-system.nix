
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-package-system-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-package-system/2015-06-08/asdf-package-system-20150608-git.tgz";
        sha256 = "49786f356fa74696a058dbb8be27afe2572e489f5d6929147a8ac11298e38e9e";
      };
    }
