
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump, 
   lisp_plump-dom, lisp_plump-lexer, lisp_plump-parser,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump-dom lisp_plump-lexer lisp_plump-parser  ];
      inherit stdenv;
      systemName = "plump";
      
      sourceProject = "${lisp-project_plump}";
      patches = [];
      lisp_dependencies = "${lisp_plump-dom} ${lisp_plump-lexer} ${lisp_plump-parser}";
      name = "lisp_plump-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
