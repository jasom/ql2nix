
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-stm, 
   lisp_bordeaux-threads, lisp_arnesi,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_arnesi  ];
      inherit stdenv;
      systemName = "cl-stm";
      
      sourceProject = "${lisp-project_cl-stm}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_arnesi}";
      name = "lisp_cl-stm-20101207-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
