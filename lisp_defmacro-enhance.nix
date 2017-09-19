
{ buildLispPackage, stdenv, fetchurl, lisp-project_defmacro-enhance, 
   lisp_cl-indeterminism, lisp_hu-dwim-walker, lisp_cl-splicing-macro, lisp_iterate, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-indeterminism lisp_hu-dwim-walker lisp_cl-splicing-macro lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "defmacro-enhance";
      
      sourceProject = "${lisp-project_defmacro-enhance}";
      patches = [];
      lisp_dependencies = "${lisp_cl-indeterminism} ${lisp_hu-dwim-walker} ${lisp_cl-splicing-macro} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_defmacro-enhance-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
