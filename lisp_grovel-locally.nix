
{ buildLispPackage, stdenv, fetchurl, lisp-project_grovel-locally, 
   lisp_cffi, lisp_cffi-grovel, lisp_with-cached-reader-conditionals, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cffi-grovel lisp_with-cached-reader-conditionals lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "grovel-locally";
      
      sourceProject = "${lisp-project_grovel-locally}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cffi-grovel} ${lisp_with-cached-reader-conditionals} ${lisp_cl-ppcre}";
      name = "lisp_grovel-locally-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
