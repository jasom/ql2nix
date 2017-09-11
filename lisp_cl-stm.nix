
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-stm, 
   lisp_arnesi, lisp_bordeaux-threads, lisp_closer-mop,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_bordeaux-threads lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-stm";
      
      sourceProject = "${lisp-project_cl-stm}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_bordeaux-threads} ${lisp_closer-mop}";
      name = "lisp_cl-stm-20101207-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
