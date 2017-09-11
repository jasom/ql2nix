
{ buildLispPackage, stdenv, fetchurl, lisp-project_intel-hex, 
   lisp_intel-hex, lisp_prove, lisp_prove-asdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_intel-hex lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "intel-hex-test";
      
      sourceProject = "${lisp-project_intel-hex}";
      patches = [];
      lisp_dependencies = "${lisp_intel-hex} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_intel-hex-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
