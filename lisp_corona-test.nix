
{ buildLispPackage, stdenv, fetchurl, lisp-project_corona, 
   lisp_archive, lisp_cl-fad, lisp_clack, lisp_clack-v1-compat, lisp_corona, lisp_fiveam,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_archive lisp_cl-fad lisp_clack lisp_clack-v1-compat lisp_corona lisp_fiveam  ];
      inherit stdenv;
      systemName = "corona-test";
      
      sourceProject = "${lisp-project_corona}";
      patches = [];
      lisp_dependencies = "${lisp_archive} ${lisp_cl-fad} ${lisp_clack} ${lisp_clack-v1-compat} ${lisp_corona} ${lisp_fiveam}";
      name = "lisp_corona-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
