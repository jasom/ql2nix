
{ buildLispPackage, stdenv, fetchurl, lisp-project_with-cached-reader-conditionals, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "with-cached-reader-conditionals";
      
      sourceProject = "${lisp-project_with-cached-reader-conditionals}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_with-cached-reader-conditionals-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
