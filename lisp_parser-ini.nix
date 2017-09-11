
{ buildLispPackage, stdenv, fetchurl, lisp-project_parser-ini, 
   lisp_alexandria, lisp_let-plus, lisp_more-conditions, lisp_esrap, lisp_architecture-builder-protocol,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus lisp_more-conditions lisp_esrap lisp_architecture-builder-protocol  ];
      inherit stdenv;
      systemName = "parser.ini";
      
      sourceProject = "${lisp-project_parser-ini}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus} ${lisp_more-conditions} ${lisp_esrap} ${lisp_architecture-builder-protocol}";
      name = "lisp_parser-ini-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
