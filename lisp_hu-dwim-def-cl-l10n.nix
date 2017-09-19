
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-def, 
   lisp_anaphora, lisp_cl-l10n, lisp_hu-dwim-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-l10n lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.def+cl-l10n";
      
      sourceProject = "${lisp-project_hu-dwim-def}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-l10n} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-def-cl-l10n-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
