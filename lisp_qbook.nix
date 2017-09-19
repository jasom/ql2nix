
{ buildLispPackage, stdenv, fetchurl, lisp-project_qbook, 
   lisp_yaclml, lisp_cl-ppcre, lisp_arnesi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yaclml lisp_cl-ppcre lisp_arnesi  ];
      inherit stdenv;
      systemName = "qbook";
      
      sourceProject = "${lisp-project_qbook}";
      patches = [];
      lisp_dependencies = "${lisp_yaclml} ${lisp_cl-ppcre} ${lisp_arnesi}";
      name = "lisp_qbook-20130312-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
