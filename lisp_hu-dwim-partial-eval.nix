
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-partial-eval, 
   lisp_hu-dwim-walker, lisp_swank, lisp_hu-dwim-logger, lisp_hu-dwim-defclass-star-hu-dwim-def-contextl, lisp_hu-dwim-def, lisp_hu-dwim-common, lisp_hu-dwim-asdf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-walker lisp_swank lisp_hu-dwim-logger lisp_hu-dwim-defclass-star-hu-dwim-def-contextl lisp_hu-dwim-def lisp_hu-dwim-common lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.partial-eval";
      
      sourceProject = "${lisp-project_hu-dwim-partial-eval}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-walker} ${lisp_swank} ${lisp_hu-dwim-logger} ${lisp_hu-dwim-defclass-star-hu-dwim-def-contextl} ${lisp_hu-dwim-def} ${lisp_hu-dwim-common} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-partial-eval-20160531-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
