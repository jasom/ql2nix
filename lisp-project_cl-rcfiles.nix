
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-rcfiles-20111203-http.package.patch];
      name = "lisp-project_cl-rcfiles-20111203-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rcfiles/2011-12-03/cl-rcfiles-20111203-http.tgz";
        sha256 = "8f35051f357a1279fea06f4ad622227209fd95a57b8909a4246c2cd2e4628639";
      };
    }
