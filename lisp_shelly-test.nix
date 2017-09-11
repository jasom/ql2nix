
{ buildLispPackage, stdenv, fetchurl, lisp-project_shelly, 
   lisp_cl-test-more, lisp_shelly,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-test-more lisp_shelly  ];
      inherit stdenv;
      systemName = "shelly-test";
      
      sourceProject = "${lisp-project_shelly}";
      patches = [];
      lisp_dependencies = "${lisp_cl-test-more} ${lisp_shelly}";
      name = "lisp_shelly-test-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
