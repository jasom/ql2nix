
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-creditcard, 
   lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-creditcard";
      
      sourceProject = "${lisp-project_cl-creditcard}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_cl-creditcard-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
