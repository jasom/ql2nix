
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-iterative, 
   lisp_optima, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-iterative";
      
      sourceProject = "${lisp-project_cl-iterative}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_alexandria}";
      name = "lisp_cl-iterative-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
