
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-pattern, 
   lisp_cl-syntax-annot, lisp_cl-syntax, lisp_cl-annot, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax-annot lisp_cl-syntax lisp_cl-annot lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-pattern";
      
      sourceProject = "${lisp-project_cl-pattern}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax-annot} ${lisp_cl-syntax} ${lisp_cl-annot} ${lisp_alexandria}";
      name = "lisp_cl-pattern-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
