
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-defclass-star, 
   lisp_hu-dwim-def, lisp_contextl, lisp_hu-dwim-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-def lisp_contextl lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.defclass-star+hu.dwim.def+contextl";
      
      sourceProject = "${lisp-project_hu-dwim-defclass-star}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-def} ${lisp_contextl} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-defclass-star-hu-dwim-def-contextl-20150709-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
