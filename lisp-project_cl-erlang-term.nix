
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-erlang-term-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-erlang-term/2016-05-31/cl-erlang-term-20160531-git.tgz";
        sha256 = "cdf021aac427a30a4544dc19ba08a74bb7ecb0472fe64ca7db670d468c72a7ce";
      };
    }
