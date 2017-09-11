
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-delico, 
   lisp_contextl, lisp_hu-dwim-asdf, lisp_hu-dwim-def-hu-dwim-common, lisp_hu-dwim-walker,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_contextl lisp_hu-dwim-asdf lisp_hu-dwim-def-hu-dwim-common lisp_hu-dwim-walker  ];
      inherit stdenv;
      systemName = "hu.dwim.delico";
      
      sourceProject = "${lisp-project_hu-dwim-delico}";
      patches = [];
      lisp_dependencies = "${lisp_contextl} ${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_hu-dwim-walker}";
      name = "lisp_hu-dwim-delico-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
