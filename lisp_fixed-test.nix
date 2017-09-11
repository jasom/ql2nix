
{ buildLispPackage, stdenv, fetchurl, lisp-project_fixed, 
   lisp_fiveam, lisp_fixed,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_fixed  ];
      inherit stdenv;
      systemName = "fixed/test";
      
      sourceProject = "${lisp-project_fixed}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_fixed}";
      name = "lisp_fixed-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
