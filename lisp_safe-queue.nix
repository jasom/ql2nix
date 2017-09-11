
{ buildLispPackage, stdenv, fetchurl, lisp-project_safe-queue, 
   lisp_split-sequence, lisp_lparallel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_lparallel  ];
      inherit stdenv;
      systemName = "safe-queue";
      
      sourceProject = "${lisp-project_safe-queue}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_lparallel}";
      name = "lisp_safe-queue-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
