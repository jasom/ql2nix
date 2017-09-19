
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-indeterminism, 
   lisp_cl-curlex, lisp_hu-dwim-walker,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-curlex lisp_hu-dwim-walker  ];
      inherit stdenv;
      systemName = "cl-indeterminism";
      
      sourceProject = "${lisp-project_cl-indeterminism}";
      patches = [];
      lisp_dependencies = "${lisp_cl-curlex} ${lisp_hu-dwim-walker}";
      name = "lisp_cl-indeterminism-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
