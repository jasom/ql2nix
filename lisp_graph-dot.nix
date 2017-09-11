
{ buildLispPackage, stdenv, fetchurl, lisp-project_graph, 
   lisp_alexandria, lisp_cl-ppcre, lisp_curry-compose-reader-macros, lisp_graph, lisp_metabang-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_curry-compose-reader-macros lisp_graph lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "graph-dot";
      
      sourceProject = "${lisp-project_graph}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_curry-compose-reader-macros} ${lisp_graph} ${lisp_metabang-bind}";
      name = "lisp_graph-dot-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
