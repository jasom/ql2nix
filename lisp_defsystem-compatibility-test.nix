
{ buildLispPackage, stdenv, fetchurl, lisp-project_defsystem-compatibility, 
   lisp_defsystem-compatibility, lisp_lift,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defsystem-compatibility lisp_lift  ];
      inherit stdenv;
      systemName = "defsystem-compatibility-test";
      
      sourceProject = "${lisp-project_defsystem-compatibility}";
      patches = [];
      lisp_dependencies = "${lisp_defsystem-compatibility} ${lisp_lift}";
      name = "lisp_defsystem-compatibility-test-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
