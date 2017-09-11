
{ buildLispPackage, stdenv, fetchurl, lisp-project_teepeedee2, 
   lisp_fiveam, lisp_teepeedee2,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_teepeedee2  ];
      inherit stdenv;
      systemName = "teepeedee2-test";
      
      sourceProject = "${lisp-project_teepeedee2}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_teepeedee2}";
      name = "lisp_teepeedee2-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
