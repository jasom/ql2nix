
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-web, 
   lisp_aserve, lisp_unit-test,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_aserve lisp_unit-test  ];
      inherit stdenv;
      systemName = "leech";
      
      sourceProject = "${lisp-project_bknr-web}";
      patches = [];
      lisp_dependencies = "${lisp_aserve} ${lisp_unit-test}";
      name = "lisp_leech-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
