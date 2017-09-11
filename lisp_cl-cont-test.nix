
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cont, 
   lisp_cl-cont, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cont lisp_rt  ];
      inherit stdenv;
      systemName = "cl-cont-test";
      
      sourceProject = "${lisp-project_cl-cont}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cont} ${lisp_rt}";
      name = "lisp_cl-cont-test-20110219-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
