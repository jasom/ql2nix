
{ buildLispPackage, stdenv, fetchurl, lisp-project_smackjack, 
   lisp_smackjack, lisp_local-time, lisp_cl-who,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_smackjack lisp_local-time lisp_cl-who  ];
      inherit stdenv;
      systemName = "smackjack-demo";
      
      sourceProject = "${lisp-project_smackjack}";
      patches = [];
      lisp_dependencies = "${lisp_smackjack} ${lisp_local-time} ${lisp_cl-who}";
      name = "lisp_smackjack-demo-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
