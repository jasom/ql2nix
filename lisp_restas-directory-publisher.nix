
{ buildLispPackage, stdenv, fetchurl, lisp-project_restas-directory-publisher, 
   lisp_closure-template, lisp_local-time, lisp_restas,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closure-template lisp_local-time lisp_restas  ];
      inherit stdenv;
      systemName = "restas-directory-publisher";
      
      sourceProject = "${lisp-project_restas-directory-publisher}";
      patches = [];
      lisp_dependencies = "${lisp_closure-template} ${lisp_local-time} ${lisp_restas}";
      name = "lisp_restas-directory-publisher-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
