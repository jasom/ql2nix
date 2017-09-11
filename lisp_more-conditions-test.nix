
{ buildLispPackage, stdenv, fetchurl, lisp-project_more-conditions, 
   lisp_let-plus, lisp_more-conditions, lisp_fiveam,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_let-plus lisp_more-conditions lisp_fiveam  ];
      inherit stdenv;
      systemName = "more-conditions/test";
      
      sourceProject = "${lisp-project_more-conditions}";
      patches = [];
      lisp_dependencies = "${lisp_let-plus} ${lisp_more-conditions} ${lisp_fiveam}";
      name = "lisp_more-conditions-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
