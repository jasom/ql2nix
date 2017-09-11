
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-inferiors, 
   lisp_external-program, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_external-program lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "simple-inferiors";
      
      sourceProject = "${lisp-project_simple-inferiors}";
      patches = [];
      lisp_dependencies = "${lisp_external-program} ${lisp_bordeaux-threads}";
      name = "lisp_simple-inferiors-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
