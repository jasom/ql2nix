
{ buildLispPackage, stdenv, fetchurl, lisp-project_formlets, 
   lisp_cl-ppcre, lisp_cl-who, lisp_drakma, lisp_formlets, lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-who lisp_drakma lisp_formlets lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "formlets-test";
      
      sourceProject = "${lisp-project_formlets}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-who} ${lisp_drakma} ${lisp_formlets} ${lisp_hunchentoot}";
      name = "lisp_formlets-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
