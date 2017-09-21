
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-logger, 
   lisp_swank, lisp_local-time, lisp_hu-dwim-util-threads, lisp_hu-dwim-def-namespace, lisp_bordeaux-threads, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_local-time lisp_hu-dwim-util-threads lisp_hu-dwim-def-namespace lisp_bordeaux-threads lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.logger+swank";
      
      sourceProject = "${lisp-project_hu-dwim-logger}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_local-time} ${lisp_hu-dwim-util-threads} ${lisp_hu-dwim-def-namespace} ${lisp_bordeaux-threads} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-logger-swank-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }