
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-common-rules, 
   lisp_split-sequence, lisp_architecture-builder-protocol, lisp_esrap, lisp_let-plus, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_architecture-builder-protocol lisp_esrap lisp_let-plus lisp_alexandria  ];
      inherit stdenv;
      systemName = "parser.common-rules.operators";
      
      sourceProject = "${lisp-project_parser-common-rules}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_architecture-builder-protocol} ${lisp_esrap} ${lisp_let-plus} ${lisp_alexandria}";
      name = "lisp_parser-common-rules-operators-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
