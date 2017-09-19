
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-common-rules, 
   lisp_esrap, lisp_let-plus, lisp_split-sequence, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_let-plus lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "parser.common-rules";
      
      sourceProject = "${lisp-project_parser-common-rules}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_let-plus} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_parser-common-rules-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
