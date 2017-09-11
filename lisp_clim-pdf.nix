
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_cl-pdf, lisp_clim-basic, lisp_clim-postscript-font, lisp_flexi-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pdf lisp_clim-basic lisp_clim-postscript-font lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "clim-pdf";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pdf} ${lisp_clim-basic} ${lisp_clim-postscript-font} ${lisp_flexi-streams}";
      name = "lisp_clim-pdf-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
