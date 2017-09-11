
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_clim-core,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clim-core  ];
      inherit stdenv;
      systemName = "slim";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_clim-core}";
      name = "lisp_slim-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
