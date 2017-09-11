
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_html-encode-1.2";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/html-encode/2010-10-06/html-encode-1.2.tgz";
        sha256 = "8e3da4ad3416b5b9969a76bad7c6a08e7a923bb89bcc5f21d7c5f9922c47ae1a";
      };
    }
