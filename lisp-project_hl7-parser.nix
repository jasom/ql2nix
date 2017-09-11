
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hl7-parser-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hl7-parser/2016-05-31/hl7-parser-20160531-git.tgz";
        sha256 = "52674e8743946e95be0863ab17f2c35359fa8ba888e147ef788bf51f04383bac";
      };
    }
