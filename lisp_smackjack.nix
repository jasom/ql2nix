
{ buildLispPackage, stdenv, fetchurl, lisp-project_smackjack, 
   lisp_alexandria, lisp_hunchentoot, lisp_cl-json, lisp_parenscript, lisp_cl-containers,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_hunchentoot lisp_cl-json lisp_parenscript lisp_cl-containers  ];
      inherit stdenv;
      systemName = "smackjack";
      
      sourceProject = "${lisp-project_smackjack}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_hunchentoot} ${lisp_cl-json} ${lisp_parenscript} ${lisp_cl-containers}";
      name = "lisp_smackjack-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
