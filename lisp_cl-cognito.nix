
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cognito, 
   lisp_ironclad, lisp_cl-json-helper, lisp_cl-json, lisp_dexador, lisp_babel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_cl-json-helper lisp_cl-json lisp_dexador lisp_babel  ];
      inherit stdenv;
      systemName = "cl-cognito";
      
      sourceProject = "${lisp-project_cl-cognito}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_cl-json-helper} ${lisp_cl-json} ${lisp_dexador} ${lisp_babel}";
      name = "lisp_cl-cognito-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
