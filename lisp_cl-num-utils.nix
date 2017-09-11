
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-num-utils, 
   lisp_alexandria, lisp_anaphora, lisp_array-operations, lisp_cl-slice, lisp_let-plus,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_array-operations lisp_cl-slice lisp_let-plus  ];
      inherit stdenv;
      systemName = "cl-num-utils";
      
      sourceProject = "${lisp-project_cl-num-utils}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_array-operations} ${lisp_cl-slice} ${lisp_let-plus}";
      name = "lisp_cl-num-utils-20131211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
