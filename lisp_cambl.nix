
{ buildLispPackage, stdenv, fetchurl, lisp-project_cambl, 
   lisp_alexandria, lisp_cl-containers, lisp_fprog, lisp_local-time, lisp_periods,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-containers lisp_fprog lisp_local-time lisp_periods  ];
      inherit stdenv;
      systemName = "cambl";
      
      sourceProject = "${lisp-project_cambl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-containers} ${lisp_fprog} ${lisp_local-time} ${lisp_periods}";
      name = "lisp_cambl-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
