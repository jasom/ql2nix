
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-def, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-common, lisp_hu-dwim-stefil-hu-dwim-def, lisp_optima,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-common lisp_hu-dwim-stefil-hu-dwim-def lisp_optima  ];
      inherit stdenv;
      systemName = "hu.dwim.def.test";
      
      sourceProject = "${lisp-project_hu-dwim-def}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-common} ${lisp_hu-dwim-stefil-hu-dwim-def} ${lisp_optima}";
      name = "lisp_hu-dwim-def-test-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
