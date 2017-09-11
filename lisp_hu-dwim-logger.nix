
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-logger, 
   lisp_bordeaux-threads, lisp_hu-dwim-asdf, lisp_hu-dwim-def-hu-dwim-common, lisp_hu-dwim-def-namespace, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-util, lisp_local-time,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_hu-dwim-asdf lisp_hu-dwim-def-hu-dwim-common lisp_hu-dwim-def-namespace lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-util lisp_local-time  ];
      inherit stdenv;
      systemName = "hu.dwim.logger";
      
      sourceProject = "${lisp-project_hu-dwim-logger}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_hu-dwim-def-namespace} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-util} ${lisp_local-time}";
      name = "lisp_hu-dwim-logger-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
