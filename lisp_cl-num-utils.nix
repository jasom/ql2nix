
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-num-utils, 
   lisp_cl-slice, lisp_array-operations, lisp_alexandria, lisp_anaphora,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-slice lisp_array-operations lisp_alexandria lisp_anaphora  ];
      inherit stdenv;
      systemName = "cl-num-utils";
      
      sourceProject = "${lisp-project_cl-num-utils}";
      patches = [];
      lisp_dependencies = "${lisp_cl-slice} ${lisp_array-operations} ${lisp_alexandria} ${lisp_anaphora}";
      name = "lisp_cl-num-utils-20131211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
