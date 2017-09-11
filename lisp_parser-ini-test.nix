
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-ini, 
   lisp_alexandria, lisp_let-plus, lisp_fiveam, lisp_parser-ini,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus lisp_fiveam lisp_parser-ini  ];
      inherit stdenv;
      systemName = "parser.ini/test";
      
      sourceProject = "${lisp-project_parser-ini}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus} ${lisp_fiveam} ${lisp_parser-ini}";
      name = "lisp_parser-ini-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
