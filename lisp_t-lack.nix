
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_clack, lisp_clack-v1-compat, lisp_lack, lisp_prove, lisp_prove-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack lisp_clack-v1-compat lisp_lack lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "t-lack";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_clack} ${lisp_clack-v1-compat} ${lisp_lack} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_t-lack-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
