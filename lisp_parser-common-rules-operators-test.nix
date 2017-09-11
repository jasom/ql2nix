
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-common-rules, 
   lisp_fiveam, lisp_parser-common-rules-operators,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_parser-common-rules-operators  ];
      inherit stdenv;
      systemName = "parser.common-rules.operators/test";
      
      sourceProject = "${lisp-project_parser-common-rules}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_parser-common-rules-operators}";
      name = "lisp_parser-common-rules-operators-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
