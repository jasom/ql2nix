
{ buildLispPackage, stdenv, fetchurl, lisp-project_oneliner, 
   lisp_cl-ppcre, lisp_lisp-unit, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_lisp-unit lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-oneliner";
      
      sourceProject = "${lisp-project_oneliner}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_lisp-unit} ${lisp_split-sequence}";
      name = "lisp_cl-oneliner-20131003-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }