
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-monad-macros, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-monad-macros";
      
      sourceProject = "${lisp-project_cl-monad-macros}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-monad-macros-20110619-svn";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
