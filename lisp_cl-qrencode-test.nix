
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-qrencode, 
   lisp_cl-qrencode, lisp_lisp-unit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-qrencode lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "cl-qrencode-test";
      
      sourceProject = "${lisp-project_cl-qrencode}";
      patches = [];
      lisp_dependencies = "${lisp_cl-qrencode} ${lisp_lisp-unit}";
      name = "lisp_cl-qrencode-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
