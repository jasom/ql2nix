
{ buildLispPackage, stdenv, fetchurl, lisp-project_dyna, 
   lisp_prove-asdf, lisp_dyna, lisp_prove,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_dyna lisp_prove  ];
      inherit stdenv;
      systemName = "dyna-test";
      
      sourceProject = "${lisp-project_dyna}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_dyna} ${lisp_prove}";
      name = "lisp_dyna-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
