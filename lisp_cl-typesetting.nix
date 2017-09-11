
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-typesetting, 
   lisp_cl-pdf,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pdf  ];
      inherit stdenv;
      systemName = "cl-typesetting";
      
      sourceProject = "${lisp-project_cl-typesetting}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pdf}";
      name = "lisp_cl-typesetting-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
