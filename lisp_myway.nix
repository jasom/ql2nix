
{ buildLispPackage, stdenv, fetchurl, lisp-project_myway, 
   lisp_alexandria, lisp_cl-ppcre, lisp_cl-utilities, lisp_map-set, lisp_quri,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_cl-utilities lisp_map-set lisp_quri  ];
      inherit stdenv;
      systemName = "myway";
      
      sourceProject = "${lisp-project_myway}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_cl-utilities} ${lisp_map-set} ${lisp_quri}";
      name = "lisp_myway-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
