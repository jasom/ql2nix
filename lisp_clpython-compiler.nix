
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-python, 
   lisp_cl-custom-hash-table, lisp_cl-fad, lisp_yacc, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-custom-hash-table lisp_cl-fad lisp_yacc lisp_closer-mop  ];
      inherit stdenv;
      systemName = "clpython/compiler";
      
      sourceProject = "${lisp-project_cl-python}";
      patches = [];
      lisp_dependencies = "${lisp_cl-custom-hash-table} ${lisp_cl-fad} ${lisp_yacc} ${lisp_closer-mop}";
      name = "lisp_clpython-compiler-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
