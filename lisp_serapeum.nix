
{ buildLispPackage, stdenv, fetchurl, lisp-project_serapeum, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-algebraic-data-type, lisp_fare-quasiquote-extras, lisp_global-vars, lisp_introspect-environment, lisp_named-readtables, lisp_parse-declarations-1-0, lisp_parse-number, lisp_split-sequence, lisp_string-case, lisp_trivia, lisp_trivia-quasiquote, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-algebraic-data-type lisp_fare-quasiquote-extras lisp_global-vars lisp_introspect-environment lisp_named-readtables lisp_parse-declarations-1-0 lisp_parse-number lisp_split-sequence lisp_string-case lisp_trivia lisp_trivia-quasiquote lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "serapeum";
      
      sourceProject = "${lisp-project_serapeum}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-algebraic-data-type} ${lisp_fare-quasiquote-extras} ${lisp_global-vars} ${lisp_introspect-environment} ${lisp_named-readtables} ${lisp_parse-declarations-1-0} ${lisp_parse-number} ${lisp_split-sequence} ${lisp_string-case} ${lisp_trivia} ${lisp_trivia-quasiquote} ${lisp_trivial-garbage}";
      name = "lisp_serapeum-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
