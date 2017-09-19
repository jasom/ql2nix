
{ buildLispPackage, stdenv, fetchurl, lisp-project_crypto-shortcuts, 
   lisp_flexi-streams, lisp_cl-base64, lisp_ironclad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_cl-base64 lisp_ironclad  ];
      inherit stdenv;
      systemName = "crypto-shortcuts";
      
      sourceProject = "${lisp-project_crypto-shortcuts}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_cl-base64} ${lisp_ironclad}";
      name = "lisp_crypto-shortcuts-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
