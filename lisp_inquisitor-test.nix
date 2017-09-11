
{ buildLispPackage, stdenv, fetchurl, lisp-project_inquisitor, 
   lisp_babel, lisp_inquisitor, lisp_prove, lisp_prove-asdf,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_inquisitor lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "inquisitor-test";
      
      sourceProject = "${lisp-project_inquisitor}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_inquisitor} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_inquisitor-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
