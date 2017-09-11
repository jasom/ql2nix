
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sat, 
   lisp_cl-sat, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-sat lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-sat.test";
      
      sourceProject = "${lisp-project_cl-sat}";
      patches = [];
      lisp_dependencies = "${lisp_cl-sat} ${lisp_fiveam}";
      name = "lisp_cl-sat-test-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
