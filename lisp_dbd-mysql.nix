
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_cl-mysql, lisp_cl-syntax, lisp_cl-syntax-annot, lisp_dbi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mysql lisp_cl-syntax lisp_cl-syntax-annot lisp_dbi  ];
      inherit stdenv;
      systemName = "dbd-mysql";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mysql} ${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_dbi}";
      name = "lisp_dbd-mysql-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
