
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-defclass-star, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-def, lisp_hu-dwim-defclass-star,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-def lisp_hu-dwim-defclass-star  ];
      inherit stdenv;
      systemName = "hu.dwim.defclass-star+hu.dwim.def";
      
      sourceProject = "${lisp-project_hu-dwim-defclass-star}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def} ${lisp_hu-dwim-defclass-star}";
      name = "lisp_hu-dwim-defclass-star-hu-dwim-def-20150709-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
