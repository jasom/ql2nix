
{ buildLispPackage, stdenv, fetchurl, lisp-project_defsystem-compatibility, 
   lisp_metatilities-base,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "defsystem-compatibility";
      
      sourceProject = "${lisp-project_defsystem-compatibility}";
      patches = [];
      lisp_dependencies = "${lisp_metatilities-base}";
      name = "lisp_defsystem-compatibility-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
