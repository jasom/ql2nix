
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-splicing-macro, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-splicing-macro";
      
      sourceProject = "${lisp-project_cl-splicing-macro}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-splicing-macro-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
