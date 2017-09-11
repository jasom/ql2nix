
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pdf, 
   lisp_iterate, lisp_zpb-ttf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_zpb-ttf  ];
      inherit stdenv;
      systemName = "cl-pdf";
      
      sourceProject = "${lisp-project_cl-pdf}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_zpb-ttf}";
      name = "lisp_cl-pdf-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
