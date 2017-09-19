
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-def, 
   lisp_trivial-garbage, lisp_hu-dwim-util, lisp_metabang-bind, lisp_iterate, lisp_anaphora, lisp_bordeaux-threads, lisp_hu-dwim-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_hu-dwim-util lisp_metabang-bind lisp_iterate lisp_anaphora lisp_bordeaux-threads lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.def.namespace";
      
      sourceProject = "${lisp-project_hu-dwim-def}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_hu-dwim-util} ${lisp_metabang-bind} ${lisp_iterate} ${lisp_anaphora} ${lisp_bordeaux-threads} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-def-namespace-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
