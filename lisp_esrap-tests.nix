
{ buildLispPackage, stdenv, fetchurl, lisp-project_esrap, 
   lisp_esrap, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_fiveam  ];
      inherit stdenv;
      systemName = "esrap/tests";
      
      sourceProject = "${lisp-project_esrap}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_fiveam}";
      name = "lisp_esrap-tests-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
