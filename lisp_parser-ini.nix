
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-ini, 
   lisp_architecture-builder-protocol, lisp_esrap, lisp_more-conditions, lisp_let-plus, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_architecture-builder-protocol lisp_esrap lisp_more-conditions lisp_let-plus lisp_alexandria  ];
      inherit stdenv;
      systemName = "parser.ini";
      
      sourceProject = "${lisp-project_parser-ini}";
      patches = [];
      lisp_dependencies = "${lisp_architecture-builder-protocol} ${lisp_esrap} ${lisp_more-conditions} ${lisp_let-plus} ${lisp_alexandria}";
      name = "lisp_parser-ini-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
