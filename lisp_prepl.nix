
{ buildLispPackage, stdenv, fetchurl, lisp-project_prepl, 
   lisp_bordeaux-threads, lisp_closer-mop, lisp_conium, lisp_iterate, lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_closer-mop lisp_conium lisp_iterate lisp_named-readtables  ];
      inherit stdenv;
      systemName = "prepl";
      
      sourceProject = "${lisp-project_prepl}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_closer-mop} ${lisp_conium} ${lisp_iterate} ${lisp_named-readtables}";
      name = "lisp_prepl-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
