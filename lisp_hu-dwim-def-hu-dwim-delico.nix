
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-def, 
   lisp_hu-dwim-asdf, lisp_alexandria, lisp_anaphora, lisp_iterate, lisp_metabang-bind, lisp_hu-dwim-delico,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_alexandria lisp_anaphora lisp_iterate lisp_metabang-bind lisp_hu-dwim-delico  ];
      inherit stdenv;
      systemName = "hu.dwim.def+hu.dwim.delico";
      
      sourceProject = "${lisp-project_hu-dwim-def}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_alexandria} ${lisp_anaphora} ${lisp_iterate} ${lisp_metabang-bind} ${lisp_hu-dwim-delico}";
      name = "lisp_hu-dwim-def-hu-dwim-delico-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
