
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-viz-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-viz/2017-01-24/asdf-viz-20170124-git.tgz";
        sha256 = "a1f9fb084dbed8240f55e4475c8c8a9ef8f8ec2ece34b3deca9decb9a15baaeb";
      };
    }
