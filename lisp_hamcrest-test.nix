
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamcrest, 
   lisp_prove-asdf, lisp_hamcrest-prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_hamcrest-prove  ];
      inherit stdenv;
      systemName = "hamcrest-test";
      
      sourceProject = "${lisp-project_cl-hamcrest}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_hamcrest-prove}";
      name = "lisp_hamcrest-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
