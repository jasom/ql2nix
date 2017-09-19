
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-util, 
   lisp_hu-dwim-syntax-sugar, lisp_hu-dwim-common, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-syntax-sugar lisp_hu-dwim-common lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.util/error-handling";
      
      sourceProject = "${lisp-project_hu-dwim-util}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-syntax-sugar} ${lisp_hu-dwim-common} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-util-error-handling-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
