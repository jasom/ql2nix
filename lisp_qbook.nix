
{ buildLispPackage, stdenv, fetchurl, lisp-project_qbook, 
   lisp_arnesi, lisp_cl-ppcre, lisp_iterate, lisp_yaclml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi lisp_cl-ppcre lisp_iterate lisp_yaclml  ];
      inherit stdenv;
      systemName = "qbook";
      
      sourceProject = "${lisp-project_qbook}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_yaclml}";
      name = "lisp_qbook-20130312-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
