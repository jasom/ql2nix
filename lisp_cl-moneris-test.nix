
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-moneris, 
   lisp_cl-moneris, lisp_eos,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-moneris lisp_eos  ];
      inherit stdenv;
      systemName = "cl-moneris-test";
      
      sourceProject = "${lisp-project_cl-moneris}";
      patches = [];
      lisp_dependencies = "${lisp_cl-moneris} ${lisp_eos}";
      name = "lisp_cl-moneris-test-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
