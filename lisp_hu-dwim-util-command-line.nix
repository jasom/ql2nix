
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-util, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-def-hu-dwim-common, lisp_hu-dwim-defclass-star-hu-dwim-def, lisp_hu-dwim-syntax-sugar, lisp_command-line-arguments,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-def-hu-dwim-common lisp_hu-dwim-defclass-star-hu-dwim-def lisp_hu-dwim-syntax-sugar lisp_command-line-arguments  ];
      inherit stdenv;
      systemName = "hu.dwim.util/command-line";
      
      sourceProject = "${lisp-project_hu-dwim-util}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-def-hu-dwim-common} ${lisp_hu-dwim-defclass-star-hu-dwim-def} ${lisp_hu-dwim-syntax-sugar} ${lisp_command-line-arguments}";
      name = "lisp_hu-dwim-util-command-line-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }