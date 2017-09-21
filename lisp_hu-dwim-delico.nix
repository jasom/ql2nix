
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-delico, 
   lisp_hu-dwim-walker, lisp_hu-dwim-def-hu-dwim-common, lisp_contextl, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-walker lisp_hu-dwim-def-hu-dwim-common lisp_contextl lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.delico";
      
      sourceProject = "${lisp-project_hu-dwim-delico}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-walker} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_contextl} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-delico-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }