
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-webdav-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-webdav/2017-08-30/cl-webdav-20170830-git.tgz";
        sha256 = "6efa0c3d699d2122a61d18178d50f86c88327f16d7a57cc9dcf12d4e75bc62a5";
      };
    }
