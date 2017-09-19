
{ buildLispPackage, stdenv, fetchurl, lisp-project_datafly, 
   lisp_log4cl, lisp_kebab, lisp_jonathan, lisp_function-cache, lisp_local-time, lisp_babel, lisp_dbi, lisp_sxql, lisp_cl-syntax-annot, lisp_trivial-types, lisp_optima, lisp_iterate,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_log4cl lisp_kebab lisp_jonathan lisp_function-cache lisp_local-time lisp_babel lisp_dbi lisp_sxql lisp_cl-syntax-annot lisp_trivial-types lisp_optima lisp_iterate  ];
      inherit stdenv;
      systemName = "datafly";
      
      sourceProject = "${lisp-project_datafly}";
      patches = [];
      lisp_dependencies = "${lisp_log4cl} ${lisp_kebab} ${lisp_jonathan} ${lisp_function-cache} ${lisp_local-time} ${lisp_babel} ${lisp_dbi} ${lisp_sxql} ${lisp_cl-syntax-annot} ${lisp_trivial-types} ${lisp_optima} ${lisp_iterate}";
      name = "lisp_datafly-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
