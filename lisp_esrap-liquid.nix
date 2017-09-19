
{ buildLispPackage, stdenv, fetchurl, lisp-project_esrap-liquid, 
   lisp_cl-interpol, lisp_cl-ppcre, lisp_iterate, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-interpol lisp_cl-ppcre lisp_iterate lisp_alexandria  ];
      inherit stdenv;
      systemName = "esrap-liquid";
      
      sourceProject = "${lisp-project_esrap-liquid}";
      patches = [];
      lisp_dependencies = "${lisp_cl-interpol} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_alexandria}";
      name = "lisp_esrap-liquid-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
