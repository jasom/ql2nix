
{ buildLispPackage, stdenv, fetchurl, lisp-project_myway, 
   lisp_map-set, lisp_quri, lisp_cl-ppcre,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_map-set lisp_quri lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "myway";
      
      sourceProject = "${lisp-project_myway}";
      patches = [];
      lisp_dependencies = "${lisp_map-set} ${lisp_quri} ${lisp_cl-ppcre}";
      name = "lisp_myway-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
