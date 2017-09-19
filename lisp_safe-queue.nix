
{ buildLispPackage, stdenv, fetchurl, lisp-project_safe-queue, 
   lisp_lparallel, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lparallel lisp_split-sequence  ];
      inherit stdenv;
      systemName = "safe-queue";
      
      sourceProject = "${lisp-project_safe-queue}";
      patches = [];
      lisp_dependencies = "${lisp_lparallel} ${lisp_split-sequence}";
      name = "lisp_safe-queue-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
