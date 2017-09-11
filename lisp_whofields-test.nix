
{ buildLispPackage, stdenv, fetchurl, lisp-project_whofields, 
   lisp_lisp-unit, lisp_cl-who,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit lisp_cl-who  ];
      inherit stdenv;
      systemName = "whofields/test";
      
      sourceProject = "${lisp-project_whofields}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit} ${lisp_cl-who}";
      name = "lisp_whofields-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
