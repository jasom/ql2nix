
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-paymill, 
   lisp_st-json, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_st-json lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-paymill";
      
      sourceProject = "${lisp-project_cl-paymill}";
      patches = [];
      lisp_dependencies = "${lisp_st-json} ${lisp_drakma}";
      name = "lisp_cl-paymill-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
