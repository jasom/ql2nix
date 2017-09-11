
{ buildLispPackage, stdenv, fetchurl, lisp-project_snakes, 
   lisp_cl-cont, lisp_cl-utilities, lisp_closer-mop, lisp_fiveam, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cont lisp_cl-utilities lisp_closer-mop lisp_fiveam lisp_iterate  ];
      inherit stdenv;
      systemName = "snakes";
      
      sourceProject = "${lisp-project_snakes}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cont} ${lisp_cl-utilities} ${lisp_closer-mop} ${lisp_fiveam} ${lisp_iterate}";
      name = "lisp_snakes-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
