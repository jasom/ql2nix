
{ buildLispPackage, stdenv, fetchurl, lisp-project_pettomato-deque, 
   lisp_fiveam, lisp_pettomato-deque,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_pettomato-deque  ];
      inherit stdenv;
      systemName = "pettomato-deque-tests";
      
      sourceProject = "${lisp-project_pettomato-deque}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_pettomato-deque}";
      name = "lisp_pettomato-deque-tests-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
