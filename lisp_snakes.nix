
{ buildLispPackage, stdenv, fetchurl, lisp-project_snakes, 
   lisp_cl-utilities, lisp_iterate, lisp_fiveam, lisp_cl-cont,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-utilities lisp_iterate lisp_fiveam lisp_cl-cont  ];
      inherit stdenv;
      systemName = "snakes";
      
      sourceProject = "${lisp-project_snakes}";
      patches = [];
      lisp_dependencies = "${lisp_cl-utilities} ${lisp_iterate} ${lisp_fiveam} ${lisp_cl-cont}";
      name = "lisp_snakes-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
