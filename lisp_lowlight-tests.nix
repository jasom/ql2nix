
{ buildLispPackage, stdenv, fetchurl, lisp-project_lowlight, 
   lisp_fiveam, lisp_lowlight,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_lowlight  ];
      inherit stdenv;
      systemName = "lowlight.tests";
      
      sourceProject = "${lisp-project_lowlight}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_lowlight}";
      name = "lisp_lowlight-tests-20131211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
