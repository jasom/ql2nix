
{ buildLispPackage, stdenv, fetchurl, lisp-project_smackjack, 
   lisp_cl-who, lisp_local-time, lisp_cl-containers, lisp_parenscript, lisp_cl-json, lisp_hunchentoot, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who lisp_local-time lisp_cl-containers lisp_parenscript lisp_cl-json lisp_hunchentoot lisp_alexandria  ];
      inherit stdenv;
      systemName = "smackjack-demo";
      
      sourceProject = "${lisp-project_smackjack}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who} ${lisp_local-time} ${lisp_cl-containers} ${lisp_parenscript} ${lisp_cl-json} ${lisp_hunchentoot} ${lisp_alexandria}";
      name = "lisp_smackjack-demo-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
