
{ buildLispPackage, stdenv, fetchurl, lisp-project_lichat-serverlib, 
   lisp_crypto-shortcuts, lisp_lichat-protocol,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_crypto-shortcuts lisp_lichat-protocol  ];
      inherit stdenv;
      systemName = "lichat-serverlib";
      
      sourceProject = "${lisp-project_lichat-serverlib}";
      patches = [];
      lisp_dependencies = "${lisp_crypto-shortcuts} ${lisp_lichat-protocol}";
      name = "lisp_lichat-serverlib-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
