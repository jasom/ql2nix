
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_elf-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/elf/2014-07-13/elf-20140713-git.tgz";
        sha256 = "221cb7cd2b8486e6fb272dc976e5316d2e780473d8b152a65da4e5d87f0ee35d";
      };
    }
