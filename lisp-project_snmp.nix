
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_snmp-6.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/snmp/2016-10-31/snmp-6.1.tgz";
        sha256 = "092e29e52924f16334473eac443d4ae85f28bd613b92af3e94dacbca7fbcb4f9";
      };
    }
