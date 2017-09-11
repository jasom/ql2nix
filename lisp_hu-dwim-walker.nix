
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-walker, 
   lisp_alexandria, lisp_anaphora, lisp_closer-mop, lisp_contextl, lisp_hu-dwim-asdf, lisp_hu-dwim-common-lisp, lisp_hu-dwim-def-contextl, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-util, lisp_metabang-bind,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_closer-mop lisp_contextl lisp_hu-dwim-asdf lisp_hu-dwim-common-lisp lisp_hu-dwim-def-contextl lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-util lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "hu.dwim.walker";
      
      sourceProject = "${lisp-project_hu-dwim-walker}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_closer-mop} ${lisp_contextl} ${lisp_hu-dwim-asdf} ${lisp_hu-dwim-common-lisp} ${lisp_hu-dwim-def-contextl} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-util} ${lisp_metabang-bind}";
      name = "lisp_hu-dwim-walker-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
