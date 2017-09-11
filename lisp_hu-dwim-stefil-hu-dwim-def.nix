
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-stefil, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-def, lisp_hu-dwim-stefil,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-def lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "hu.dwim.stefil+hu.dwim.def";
      
      sourceProject = "${lisp-project_hu-dwim-stefil}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def} ${lisp_hu-dwim-stefil}";
      name = "lisp_hu-dwim-stefil-hu-dwim-def-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
