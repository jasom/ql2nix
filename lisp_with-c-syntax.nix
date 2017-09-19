
{ buildLispPackage, stdenv, fetchurl, lisp-project_with-c-syntax, 
   lisp_yacc, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yacc lisp_alexandria  ];
      inherit stdenv;
      systemName = "with-c-syntax";
      
      sourceProject = "${lisp-project_with-c-syntax}";
      patches = [];
      lisp_dependencies = "${lisp_yacc} ${lisp_alexandria}";
      name = "lisp_with-c-syntax-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
