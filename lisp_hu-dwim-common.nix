
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-common, 
   lisp_alexandria, lisp_anaphora, lisp_closer-mop, lisp_hu-dwim-asdf, lisp_hu-dwim-common-lisp, lisp_iterate, lisp_metabang-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_closer-mop lisp_hu-dwim-asdf lisp_hu-dwim-common-lisp lisp_iterate lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "hu.dwim.common";
      
      sourceProject = "${lisp-project_hu-dwim-common}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_closer-mop} ${lisp_hu-dwim-asdf} ${lisp_hu-dwim-common-lisp} ${lisp_iterate} ${lisp_metabang-bind}";
      name = "lisp_hu-dwim-common-20150709-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
