
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-oclapi-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-oclapi/2017-06-30/cl-oclapi-20170630-git.tgz";
        sha256 = "0795af5aa696cd8079512129a8dd4eeafbb28defae5a91a17d3d92317d90cf22";
      };
    }
