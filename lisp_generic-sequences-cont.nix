
{ buildLispPackage, stdenv, fetchurl, lisp-project_generic-sequences, 
   lisp_cl-cont,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cont  ];
      inherit stdenv;
      systemName = "generic-sequences-cont";
      
      sourceProject = "${lisp-project_generic-sequences}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cont}";
      name = "lisp_generic-sequences-cont-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
