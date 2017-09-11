
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-marklogic, 
   lisp_cl-json, lisp_cl-marklogic, lisp_cl-opsresearch, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_cl-marklogic lisp_cl-opsresearch lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "ml-optimizer";
      
      sourceProject = "${lisp-project_cl-marklogic}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_cl-marklogic} ${lisp_cl-opsresearch} ${lisp_hunchentoot}";
      name = "lisp_ml-optimizer-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
