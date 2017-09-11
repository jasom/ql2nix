
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tasukete, 
   lisp_prove-asdf, lisp_cl-tasukete, lisp_prove,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_cl-tasukete lisp_prove  ];
      inherit stdenv;
      systemName = "cl-tasukete-test";
      
      sourceProject = "${lisp-project_cl-tasukete}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_cl-tasukete} ${lisp_prove}";
      name = "lisp_cl-tasukete-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
