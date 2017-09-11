
{ buildLispPackage, stdenv, fetchurl, lisp-project_kenzo, 
   lisp_fiveam, lisp_kenzo,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_kenzo  ];
      inherit stdenv;
      systemName = "kenzo-test";
      
      sourceProject = "${lisp-project_kenzo}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_kenzo}";
      name = "lisp_kenzo-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
