
{ buildLispPackage, stdenv, fetchurl, lisp-project_formlets, 
   lisp_hunchentoot, lisp_drakma, lisp_cl-who,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_drakma lisp_cl-who  ];
      inherit stdenv;
      systemName = "formlets";
      
      sourceProject = "${lisp-project_formlets}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_drakma} ${lisp_cl-who}";
      name = "lisp_formlets-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
