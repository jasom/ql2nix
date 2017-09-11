
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ohm, 
   lisp_cl-ohm, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ohm lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-ohm/test";
      
      sourceProject = "${lisp-project_cl-ohm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ohm} ${lisp_fiveam}";
      name = "lisp_cl-ohm-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
