
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-marklogic, 
   lisp_fiveam, lisp_local-time, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_local-time lisp_drakma  ];
      inherit stdenv;
      systemName = "ml-dsl";
      
      sourceProject = "${lisp-project_cl-marklogic}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_local-time} ${lisp_drakma}";
      name = "lisp_ml-dsl-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
