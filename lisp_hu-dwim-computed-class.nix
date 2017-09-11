
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-computed-class, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-def-hu-dwim-common, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-syntax-sugar, lisp_hu-dwim-util,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-def-hu-dwim-common lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-syntax-sugar lisp_hu-dwim-util  ];
      inherit stdenv;
      systemName = "hu.dwim.computed-class";
      
      sourceProject = "${lisp-project_hu-dwim-computed-class}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-syntax-sugar} ${lisp_hu-dwim-util}";
      name = "lisp_hu-dwim-computed-class-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
