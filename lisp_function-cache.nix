
{ buildLispPackage, stdenv, fetchurl, lisp-project_function-cache, 
   lisp_closer-mop, lisp_symbol-munger, lisp_iterate, lisp_cl-interpol, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_symbol-munger lisp_iterate lisp_cl-interpol lisp_alexandria  ];
      inherit stdenv;
      systemName = "function-cache";
      
      sourceProject = "${lisp-project_function-cache}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_symbol-munger} ${lisp_iterate} ${lisp_cl-interpol} ${lisp_alexandria}";
      name = "lisp_function-cache-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
