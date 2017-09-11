
{ buildLispPackage, stdenv, fetchurl, lisp-project_m2cl, 
   lisp_fiveam, lisp_m2cl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_m2cl  ];
      inherit stdenv;
      systemName = "m2cl-test";
      
      sourceProject = "${lisp-project_m2cl}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_m2cl}";
      name = "lisp_m2cl-test-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
