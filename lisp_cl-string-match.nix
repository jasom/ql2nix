
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-string-match, 
   lisp_alexandria, lisp_ascii-strings, lisp_iterate, lisp_jpl-queues, lisp_yacc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_ascii-strings lisp_iterate lisp_jpl-queues lisp_yacc  ];
      inherit stdenv;
      systemName = "cl-string-match";
      
      sourceProject = "${lisp-project_cl-string-match}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_ascii-strings} ${lisp_iterate} ${lisp_jpl-queues} ${lisp_yacc}";
      name = "lisp_cl-string-match-20160421-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
