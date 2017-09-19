
{ buildLispPackage, stdenv, fetchurl, lisp-project_array-operations, 
   lisp_optima, lisp_let-plus, lisp_anaphora, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_let-plus lisp_anaphora lisp_alexandria  ];
      inherit stdenv;
      systemName = "array-operations";
      
      sourceProject = "${lisp-project_array-operations}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_let-plus} ${lisp_anaphora} ${lisp_alexandria}";
      name = "lisp_array-operations-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
