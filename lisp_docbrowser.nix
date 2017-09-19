
{ buildLispPackage, stdenv, fetchurl, lisp-project_docbrowser, 
   lisp_string-case, lisp_colorize, lisp_cl-json, lisp_swank, lisp_closer-mop, lisp_parse-number, lisp_yacc, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_string-case lisp_colorize lisp_cl-json lisp_swank lisp_closer-mop lisp_parse-number lisp_yacc lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "docbrowser";
      
      sourceProject = "${lisp-project_docbrowser}";
      patches = [];
      lisp_dependencies = "${lisp_string-case} ${lisp_colorize} ${lisp_cl-json} ${lisp_swank} ${lisp_closer-mop} ${lisp_parse-number} ${lisp_yacc} ${lisp_hunchentoot}";
      name = "lisp_docbrowser-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
