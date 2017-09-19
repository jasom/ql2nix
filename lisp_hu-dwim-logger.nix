
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-logger, 
   lisp_local-time, lisp_hu-dwim-util-threads, lisp_hu-dwim-def-namespace, lisp_bordeaux-threads, lisp_hu-dwim-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_hu-dwim-util-threads lisp_hu-dwim-def-namespace lisp_bordeaux-threads lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.logger";
      
      sourceProject = "${lisp-project_hu-dwim-logger}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_hu-dwim-util-threads} ${lisp_hu-dwim-def-namespace} ${lisp_bordeaux-threads} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-logger-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
