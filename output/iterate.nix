
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf   ];
      inherit stdenv;
      lisp_name = "sbcl-iterate";
      LD_LIBRARY_PATH = "";
      systemName = "iterate";
      lisp_dependencies = "";
      name = "iterate-20160825-darcs";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/iterate/2016-08-25/iterate-20160825-darcs.tgz";
        md5 = "e73ff4898ce4831ff2a28817f32de86e";
      };
    }
