
{ buildLispPackage, stdenv, fetchurl, lisp-project_cmu-infix, 
   lisp_cmu-infix, lisp_fiasco,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cmu-infix lisp_fiasco  ];
      inherit stdenv;
      systemName = "cmu-infix-tests";
      
      sourceProject = "${lisp-project_cmu-infix}";
      patches = [];
      lisp_dependencies = "${lisp_cmu-infix} ${lisp_fiasco}";
      name = "lisp_cmu-infix-tests-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
