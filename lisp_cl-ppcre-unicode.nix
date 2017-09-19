
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ppcre, 
   lisp_cl-unicode,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-unicode  ];
      inherit stdenv;
      systemName = "cl-ppcre-unicode";
      
      sourceProject = "${lisp-project_cl-ppcre}";
      patches = [];
      lisp_dependencies = "${lisp_cl-unicode}";
      name = "lisp_cl-ppcre-unicode-2.0.11";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
