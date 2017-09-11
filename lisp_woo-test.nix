
{ buildLispPackage, stdenv, fetchurl, lisp-project_woo, 
   lisp_clack-test, lisp_prove-asdf, lisp_woo,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-test lisp_prove-asdf lisp_woo  ];
      inherit stdenv;
      systemName = "woo-test";
      
      sourceProject = "${lisp-project_woo}";
      patches = [];
      lisp_dependencies = "${lisp_clack-test} ${lisp_prove-asdf} ${lisp_woo}";
      name = "lisp_woo-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
