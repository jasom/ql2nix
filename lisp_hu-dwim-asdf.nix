
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-asdf, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "hu.dwim.asdf";
      
      sourceProject = "${lisp-project_hu-dwim-asdf}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_hu-dwim-asdf-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
