
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pdf, 
   lisp_zpb-ttf, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zpb-ttf lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-pdf";
      
      sourceProject = "${lisp-project_cl-pdf}";
      patches = [];
      lisp_dependencies = "${lisp_zpb-ttf} ${lisp_iterate}";
      name = "lisp_cl-pdf-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }