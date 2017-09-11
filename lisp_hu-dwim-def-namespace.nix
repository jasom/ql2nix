
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-def, 
   lisp_hu-dwim-asdf, lisp_bordeaux-threads, lisp_anaphora, lisp_iterate, lisp_metabang-bind, lisp_hu-dwim-util, lisp_trivial-garbage,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_bordeaux-threads lisp_anaphora lisp_iterate lisp_metabang-bind lisp_hu-dwim-util lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "hu.dwim.def.namespace";
      
      sourceProject = "${lisp-project_hu-dwim-def}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_bordeaux-threads} ${lisp_anaphora} ${lisp_iterate} ${lisp_metabang-bind} ${lisp_hu-dwim-util} ${lisp_trivial-garbage}";
      name = "lisp_hu-dwim-def-namespace-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
