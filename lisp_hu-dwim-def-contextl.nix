
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-def, 
   lisp_metabang-bind, lisp_iterate, lisp_anaphora, lisp_alexandria, lisp_contextl, lisp_hu-dwim-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metabang-bind lisp_iterate lisp_anaphora lisp_alexandria lisp_contextl lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.def+contextl";
      
      sourceProject = "${lisp-project_hu-dwim-def}";
      patches = [];
      lisp_dependencies = "${lisp_metabang-bind} ${lisp_iterate} ${lisp_anaphora} ${lisp_alexandria} ${lisp_contextl} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-def-contextl-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
