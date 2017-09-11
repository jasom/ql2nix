
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-util, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-def-hu-dwim-common, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-syntax-sugar,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-def-hu-dwim-common lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-syntax-sugar  ];
      inherit stdenv;
      systemName = "hu.dwim.util/mop";
      
      sourceProject = "${lisp-project_hu-dwim-util}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-syntax-sugar}";
      name = "lisp_hu-dwim-util-mop-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
