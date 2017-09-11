
{ buildLispPackage, stdenv, fetchurl, lisp-project_zpng, 
   lisp_salza2,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_salza2  ];
      inherit stdenv;
      systemName = "zpng";
      
      sourceProject = "${lisp-project_zpng}";
      patches = [];
      lisp_dependencies = "${lisp_salza2}";
      name = "lisp_zpng-1.2.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
