
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gists, 
   lisp_jonathan, lisp_dexador, lisp_quri, lisp_local-time, lisp_cl-syntax-annot, lisp_cl-syntax,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_jonathan lisp_dexador lisp_quri lisp_local-time lisp_cl-syntax-annot lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "cl-gists";
      
      sourceProject = "${lisp-project_cl-gists}";
      patches = [];
      lisp_dependencies = "${lisp_jonathan} ${lisp_dexador} ${lisp_quri} ${lisp_local-time} ${lisp_cl-syntax-annot} ${lisp_cl-syntax}";
      name = "lisp_cl-gists-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
