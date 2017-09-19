
{ buildLispPackage, stdenv, fetchurl, lisp-project_graph, 
   lisp_yason, lisp_curry-compose-reader-macros, lisp_metabang-bind, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yason lisp_curry-compose-reader-macros lisp_metabang-bind lisp_alexandria  ];
      inherit stdenv;
      systemName = "graph-json";
      
      sourceProject = "${lisp-project_graph}";
      patches = [];
      lisp_dependencies = "${lisp_yason} ${lisp_curry-compose-reader-macros} ${lisp_metabang-bind} ${lisp_alexandria}";
      name = "lisp_graph-json-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
