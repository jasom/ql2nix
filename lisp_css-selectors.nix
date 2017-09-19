
{ buildLispPackage, stdenv, fetchurl, lisp-project_css-selectors, 
   lisp_buildnode, lisp_cl-ppcre, lisp_yacc, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_buildnode lisp_cl-ppcre lisp_yacc lisp_iterate  ];
      inherit stdenv;
      systemName = "css-selectors";
      
      sourceProject = "${lisp-project_css-selectors}";
      patches = [];
      lisp_dependencies = "${lisp_buildnode} ${lisp_cl-ppcre} ${lisp_yacc} ${lisp_iterate}";
      name = "lisp_css-selectors-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
