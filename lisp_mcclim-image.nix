
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_clim-basic, lisp_mcclim-bitmaps, lisp_opticl,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clim-basic lisp_mcclim-bitmaps lisp_opticl  ];
      inherit stdenv;
      systemName = "mcclim-image";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_clim-basic} ${lisp_mcclim-bitmaps} ${lisp_opticl}";
      name = "lisp_mcclim-image-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
