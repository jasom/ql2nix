
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-paymill, 
   lisp_cl-ssl, lisp_drakma, lisp_st-json,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_drakma lisp_st-json  ];
      inherit stdenv;
      systemName = "cl-paymill";
      
      sourceProject = "${lisp-project_cl-paymill}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_drakma} ${lisp_st-json}";
      name = "lisp_cl-paymill-20131111-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
