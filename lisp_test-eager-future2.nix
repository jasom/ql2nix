
{ buildLispPackage, stdenv, fetchurl, lisp-project_eager-future2, 
   lisp_eager-future2, lisp_eos,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_eager-future2 lisp_eos  ];
      inherit stdenv;
      systemName = "test.eager-future2";
      
      sourceProject = "${lisp-project_eager-future2}";
      patches = [];
      lisp_dependencies = "${lisp_eager-future2} ${lisp_eos}";
      name = "lisp_test-eager-future2-0.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
