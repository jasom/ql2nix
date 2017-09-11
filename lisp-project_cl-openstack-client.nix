
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-openstack-client-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-openstack-client/2016-08-25/cl-openstack-client-20160825-git.tgz";
        sha256 = "13f935190d74160bd65f4346fcb172668f24eef16cc7f279173b5713a93b423f";
      };
    }
