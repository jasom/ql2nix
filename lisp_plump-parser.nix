
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump, 
   lisp_plump-dom, lisp_plump-lexer, lisp_trivial-indent,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump-dom lisp_plump-lexer lisp_trivial-indent  ];
      inherit stdenv;
      systemName = "plump-parser";
      
      sourceProject = "${lisp-project_plump}";
      patches = [];
      lisp_dependencies = "${lisp_plump-dom} ${lisp_plump-lexer} ${lisp_trivial-indent}";
      name = "lisp_plump-parser-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
