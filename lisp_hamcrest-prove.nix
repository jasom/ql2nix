
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamcrest, 
   lisp_cl-reexport, lisp_split-sequence, lisp_prove, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-reexport lisp_split-sequence lisp_prove lisp_iterate  ];
      inherit stdenv;
      systemName = "hamcrest-prove";
      
      sourceProject = "${lisp-project_cl-hamcrest}";
      patches = [];
      lisp_dependencies = "${lisp_cl-reexport} ${lisp_split-sequence} ${lisp_prove} ${lisp_iterate}";
      name = "lisp_hamcrest-prove-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
