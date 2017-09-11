
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xkeysym, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-xkeysym";
      
      sourceProject = "${lisp-project_cl-xkeysym}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-xkeysym-20140914-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
