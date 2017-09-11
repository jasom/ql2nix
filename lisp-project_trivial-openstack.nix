
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-openstack-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-openstack/2016-06-28/trivial-openstack-20160628-git.tgz";
        sha256 = "a54dff412c6e2f3607d9d9b7f36d5dc38d4dfbd9aecd59686ddd504aa19e2a0d";
      };
    }
