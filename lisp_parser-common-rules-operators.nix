
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-common-rules, 
   lisp_alexandria, lisp_let-plus, lisp_esrap, lisp_architecture-builder-protocol, lisp_parser-common-rules,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus lisp_esrap lisp_architecture-builder-protocol lisp_parser-common-rules  ];
      inherit stdenv;
      systemName = "parser.common-rules.operators";
      
      sourceProject = "${lisp-project_parser-common-rules}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus} ${lisp_esrap} ${lisp_architecture-builder-protocol} ${lisp_parser-common-rules}";
      name = "lisp_parser-common-rules-operators-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
