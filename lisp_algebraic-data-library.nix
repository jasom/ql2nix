
{ buildLispPackage, stdenv, fetchurl, lisp-project_algebraic-data-library, 
   lisp_cl-algebraic-data-type,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-algebraic-data-type  ];
      inherit stdenv;
      systemName = "algebraic-data-library";
      
      sourceProject = "${lisp-project_algebraic-data-library}";
      patches = [];
      lisp_dependencies = "${lisp_cl-algebraic-data-type}";
      name = "lisp_algebraic-data-library-20131003-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
