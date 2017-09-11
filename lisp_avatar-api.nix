
{ buildLispPackage, stdenv, fetchurl, lisp-project_avatar-api, 
   lisp_cl-json, lisp_crypto-shortcuts, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_crypto-shortcuts lisp_drakma  ];
      inherit stdenv;
      systemName = "avatar-api";
      
      sourceProject = "${lisp-project_avatar-api}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_crypto-shortcuts} ${lisp_drakma}";
      name = "lisp_avatar-api-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
