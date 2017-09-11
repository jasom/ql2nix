
{ buildLispPackage, stdenv, fetchurl, lisp-project_pettomato-indexed-priority-queue, 
   lisp_fiveam, lisp_pettomato-indexed-priority-queue,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_pettomato-indexed-priority-queue  ];
      inherit stdenv;
      systemName = "pettomato-indexed-priority-queue-tests";
      
      sourceProject = "${lisp-project_pettomato-indexed-priority-queue}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_pettomato-indexed-priority-queue}";
      name = "lisp_pettomato-indexed-priority-queue-tests-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
