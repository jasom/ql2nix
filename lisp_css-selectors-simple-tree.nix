
{ buildLispPackage, stdenv, fetchurl, lisp-project_css-selectors, 
   lisp_cl-html5-parser, lisp_buildnode, lisp_cl-ppcre, lisp_yacc, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-html5-parser lisp_buildnode lisp_cl-ppcre lisp_yacc lisp_iterate  ];
      inherit stdenv;
      systemName = "css-selectors-simple-tree";
      
      sourceProject = "${lisp-project_css-selectors}";
      patches = [];
      lisp_dependencies = "${lisp_cl-html5-parser} ${lisp_buildnode} ${lisp_cl-ppcre} ${lisp_yacc} ${lisp_iterate}";
      name = "lisp_css-selectors-simple-tree-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
