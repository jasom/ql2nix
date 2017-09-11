
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fixtures, 
   lisp_prove-asdf, lisp_cl-fixtures, lisp_rutils, lisp_incf-cl, lisp_prove,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_cl-fixtures lisp_rutils lisp_incf-cl lisp_prove  ];
      inherit stdenv;
      systemName = "cl-fixtures-test";
      
      sourceProject = "${lisp-project_cl-fixtures}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_cl-fixtures} ${lisp_rutils} ${lisp_incf-cl} ${lisp_prove}";
      name = "lisp_cl-fixtures-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
