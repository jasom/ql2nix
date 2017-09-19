
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-project, 
   lisp_prove, lisp_local-time, lisp_cl-emb,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove lisp_local-time lisp_cl-emb  ];
      inherit stdenv;
      systemName = "cl-project";
      
      sourceProject = "${lisp-project_cl-project}";
      patches = [];
      lisp_dependencies = "${lisp_prove} ${lisp_local-time} ${lisp_cl-emb}";
      name = "lisp_cl-project-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
