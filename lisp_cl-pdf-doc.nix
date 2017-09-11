
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-typesetting, 
   lisp_cl-pdf, lisp_cl-typesetting,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pdf lisp_cl-typesetting  ];
      inherit stdenv;
      systemName = "cl-pdf-doc";
      
      sourceProject = "${lisp-project_cl-typesetting}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pdf} ${lisp_cl-typesetting}";
      name = "lisp_cl-pdf-doc-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
