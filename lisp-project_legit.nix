
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_legit-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/legit/2017-08-30/legit-20170830-git.tgz";
        sha256 = "8968882afec59f834f56db8ce1f8c8909dc89970d8dbeaa8155ffa1fb0d7e94b";
      };
    }
