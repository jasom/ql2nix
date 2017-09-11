
{ buildLispPackage, stdenv, fetchurl, lisp-project_formlets, 
   lisp_cl-ppcre, lisp_cl-who, lisp_drakma, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-who lisp_drakma lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "formlets";
      
      sourceProject = "${lisp-project_formlets}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-who} ${lisp_drakma} ${lisp_hunchentoot}";
      name = "lisp_formlets-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
