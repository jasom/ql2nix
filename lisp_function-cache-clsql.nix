
{ buildLispPackage, stdenv, fetchurl, lisp-project_function-cache, 
   lisp_clsql-helper, lisp_clsql, lisp_closer-mop, lisp_symbol-munger, lisp_iterate, lisp_cl-interpol, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clsql-helper lisp_clsql lisp_closer-mop lisp_symbol-munger lisp_iterate lisp_cl-interpol lisp_alexandria  ];
      inherit stdenv;
      systemName = "function-cache-clsql";
      
      sourceProject = "${lisp-project_function-cache}";
      patches = [];
      lisp_dependencies = "${lisp_clsql-helper} ${lisp_clsql} ${lisp_closer-mop} ${lisp_symbol-munger} ${lisp_iterate} ${lisp_cl-interpol} ${lisp_alexandria}";
      name = "lisp_function-cache-clsql-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
