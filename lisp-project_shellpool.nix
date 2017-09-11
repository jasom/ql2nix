
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_shellpool-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/shellpool/2015-05-05/shellpool-20150505-git.tgz";
        sha256 = "22d47ca29a42fa3be6399b022cf1591cefca7670dd2c7673fc777870c2807f16";
      };
    }
