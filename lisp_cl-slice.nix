
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-slice, 
   lisp_alexandria, lisp_anaphora, lisp_let-plus,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_let-plus  ];
      inherit stdenv;
      systemName = "cl-slice";
      
      sourceProject = "${lisp-project_cl-slice}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_let-plus}";
      name = "lisp_cl-slice-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
