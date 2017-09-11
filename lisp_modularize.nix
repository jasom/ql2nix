
{ buildLispPackage, stdenv, fetchurl, lisp-project_modularize, 
   lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "modularize";
      
      sourceProject = "${lisp-project_modularize}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils}";
      name = "lisp_modularize-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
