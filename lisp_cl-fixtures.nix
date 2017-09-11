
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fixtures, 
   lisp_x-let-star, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_x-let-star lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-fixtures";
      
      sourceProject = "${lisp-project_cl-fixtures}";
      patches = [];
      lisp_dependencies = "${lisp_x-let-star} ${lisp_alexandria}";
      name = "lisp_cl-fixtures-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
