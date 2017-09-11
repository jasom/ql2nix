
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_path-string-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/path-string/2016-08-25/path-string-20160825-git.tgz";
        sha256 = "2790eed764a115fcd2ae6404ab09ee6b3edd086d75075122a4ad1cf6cd79bba6";
      };
    }
