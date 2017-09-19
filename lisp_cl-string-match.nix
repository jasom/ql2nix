
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-string-match, 
   lisp_iterate, lisp_jpl-queues, lisp_yacc, lisp_babel, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_jpl-queues lisp_yacc lisp_babel lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-string-match";
      
      sourceProject = "${lisp-project_cl-string-match}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_jpl-queues} ${lisp_yacc} ${lisp_babel} ${lisp_alexandria}";
      name = "lisp_cl-string-match-20160421-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
