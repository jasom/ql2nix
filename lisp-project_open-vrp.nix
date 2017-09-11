
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_open-vrp-20140914-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/open-vrp/2014-09-14/open-vrp-20140914-git.tgz";
        sha256 = "ee7a910446af582ae6f068743c5be76017fedee14cb3c38faf0e1188c63dcda8";
      };
    }
