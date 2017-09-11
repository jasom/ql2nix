
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ext-blog-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ext-blog/2016-08-25/ext-blog-20160825-git.tgz";
        sha256 = "114460b00cfa103a3fe16d0501600cb20f591a011492e2effa314224585093a7";
      };
    }
