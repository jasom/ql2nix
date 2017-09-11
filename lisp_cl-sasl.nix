
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sasl, 
   lisp_ironclad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad  ];
      inherit stdenv;
      systemName = "cl-sasl";
      
      sourceProject = "${lisp-project_cl-sasl}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad}";
      name = "lisp_cl-sasl_0.3.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
