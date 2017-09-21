
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-computed-class, 
   lisp_hu-dwim-logger, lisp_hu-dwim-util-mop, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-syntax-sugar, lisp_hu-dwim-def-hu-dwim-common, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-logger lisp_hu-dwim-util-mop lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-syntax-sugar lisp_hu-dwim-def-hu-dwim-common lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.computed-class+hu.dwim.logger";
      
      sourceProject = "${lisp-project_hu-dwim-computed-class}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-logger} ${lisp_hu-dwim-util-mop} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-syntax-sugar} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-computed-class-hu-dwim-logger-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }