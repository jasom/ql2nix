
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-m4, 
   lisp_alexandria, lisp_cffi, lisp_cffi-grovel, lisp_cl-fad, lisp_cl-ppcre, lisp_external-program, lisp_graylex,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cffi lisp_cffi-grovel lisp_cl-fad lisp_cl-ppcre lisp_external-program lisp_graylex  ];
      inherit stdenv;
      systemName = "cl-m4";
      
      sourceProject = "${lisp-project_cl-m4}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cffi} ${lisp_cffi-grovel} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_external-program} ${lisp_graylex}";
      name = "lisp_cl-m4-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
