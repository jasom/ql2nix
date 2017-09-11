
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-project, 
   lisp_cl-emb, lisp_cl-ppcre, lisp_local-time, lisp_prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-emb lisp_cl-ppcre lisp_local-time lisp_prove  ];
      inherit stdenv;
      systemName = "cl-project";
      
      sourceProject = "${lisp-project_cl-project}";
      patches = [];
      lisp_dependencies = "${lisp_cl-emb} ${lisp_cl-ppcre} ${lisp_local-time} ${lisp_prove}";
      name = "lisp_cl-project-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
