
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-colors, 
   lisp_alexandria, lisp_let-plus,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_let-plus  ];
      inherit stdenv;
      systemName = "cl-colors";
      
      sourceProject = "${lisp-project_cl-colors}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_let-plus}";
      name = "lisp_cl-colors-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
