
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-strftime, 
   lisp_local-time, lisp_cl-ppcre, lisp_serapeum, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_cl-ppcre lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-strftime";
      
      sourceProject = "${lisp-project_cl-strftime}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_cl-ppcre} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_cl-strftime-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
