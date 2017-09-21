
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-6502, 
   lisp_cl-ppcre, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-6502";
      
      sourceProject = "${lisp-project_cl-6502}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_cl-6502-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }