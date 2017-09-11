
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_net-telent-date_0.42";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/net-telent-date/2010-10-06/net-telent-date_0.42.tgz";
        sha256 = "2152723b47e6f08d7f8a891349b45f7a02fe3864238160534a7d9ac85ba36d1b";
      };
    }
