
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_clim-basic, lisp_clim-postscript-font,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clim-basic lisp_clim-postscript-font  ];
      inherit stdenv;
      systemName = "clim-postscript";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_clim-basic} ${lisp_clim-postscript-font}";
      name = "lisp_clim-postscript-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
