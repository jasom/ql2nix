
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ksuid, 
   lisp_babel, lisp_ironclad, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_ironclad lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "cl-ksuid";
      
      sourceProject = "${lisp-project_cl-ksuid}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_ironclad} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_cl-ksuid-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
