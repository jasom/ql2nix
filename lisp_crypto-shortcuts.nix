
{ buildLispPackage, stdenv, fetchurl, lisp-project_crypto-shortcuts, 
   lisp_ironclad, lisp_cl-base64, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_cl-base64 lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "crypto-shortcuts";
      
      sourceProject = "${lisp-project_crypto-shortcuts}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_cl-base64} ${lisp_flexi-streams}";
      name = "lisp_crypto-shortcuts-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
