
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-opsresearch, 
   lisp_cl-opsresearch, lisp_drakma, lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-opsresearch lisp_drakma lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "or-cluster";
      
      sourceProject = "${lisp-project_cl-opsresearch}";
      patches = [];
      lisp_dependencies = "${lisp_cl-opsresearch} ${lisp_drakma} ${lisp_hunchentoot}";
      name = "lisp_or-cluster-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
