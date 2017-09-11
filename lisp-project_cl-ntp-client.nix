
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ntp-client-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ntp-client/2017-06-30/cl-ntp-client-20170630-git.tgz";
        sha256 = "5cc2e6c29934740537ed4ac987936386b097e20515f986933752e5a82ccf13e8";
      };
    }
