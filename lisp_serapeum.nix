
{ buildLispPackage, stdenv, fetchurl, lisp-project_serapeum, 
   lisp_cl-algebraic-data-type, lisp_global-vars, lisp_introspect-environment, lisp_parse-declarations-1-0, lisp_optima, lisp_bordeaux-threads, lisp_trivial-garbage, lisp_parse-number, lisp_string-case, lisp_split-sequence, lisp_fare-quasiquote-readtable, lisp_trivia, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-algebraic-data-type lisp_global-vars lisp_introspect-environment lisp_parse-declarations-1-0 lisp_optima lisp_bordeaux-threads lisp_trivial-garbage lisp_parse-number lisp_string-case lisp_split-sequence lisp_fare-quasiquote-readtable lisp_trivia lisp_alexandria  ];
      inherit stdenv;
      systemName = "serapeum";
      
      sourceProject = "${lisp-project_serapeum}";
      patches = [];
      lisp_dependencies = "${lisp_cl-algebraic-data-type} ${lisp_global-vars} ${lisp_introspect-environment} ${lisp_parse-declarations-1-0} ${lisp_optima} ${lisp_bordeaux-threads} ${lisp_trivial-garbage} ${lisp_parse-number} ${lisp_string-case} ${lisp_split-sequence} ${lisp_fare-quasiquote-readtable} ${lisp_trivia} ${lisp_alexandria}";
      name = "lisp_serapeum-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
