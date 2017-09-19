
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-debug, 
   lisp_hu-dwim-walker, lisp_hu-dwim-util, lisp_hu-dwim-defclass-star, lisp_hu-dwim-def-swank, lisp_hu-dwim-common, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-walker lisp_hu-dwim-util lisp_hu-dwim-defclass-star lisp_hu-dwim-def-swank lisp_hu-dwim-common lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.debug";
      
      sourceProject = "${lisp-project_hu-dwim-debug}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-walker} ${lisp_hu-dwim-util} ${lisp_hu-dwim-defclass-star} ${lisp_hu-dwim-def-swank} ${lisp_hu-dwim-common} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-debug-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
