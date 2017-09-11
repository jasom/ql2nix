
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rabbit, 
   lisp_cl-rabbit, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-rabbit lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-rabbit-tests";
      
      sourceProject = "${lisp-project_cl-rabbit}";
      patches = [];
      lisp_dependencies = "${lisp_cl-rabbit} ${lisp_fiveam}";
      name = "lisp_cl-rabbit-tests-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
