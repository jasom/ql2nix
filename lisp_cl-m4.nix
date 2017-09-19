
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-m4, 
   lisp_graylex, lisp_cl-fad, lisp_cl-ppcre, lisp_external-program, lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_graylex lisp_cl-fad lisp_cl-ppcre lisp_external-program lisp_cffi-grovel  ];
      inherit stdenv;
      systemName = "cl-m4";
      
      sourceProject = "${lisp-project_cl-m4}";
      patches = [];
      lisp_dependencies = "${lisp_graylex} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_external-program} ${lisp_cffi-grovel}";
      name = "lisp_cl-m4-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
