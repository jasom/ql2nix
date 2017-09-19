
{ buildLispPackage, stdenv, fetchurl, lisp-project_eager-future2, 
   lisp_eos, lisp_trivial-garbage, lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_eos lisp_trivial-garbage lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "test.eager-future2";
      
      sourceProject = "${lisp-project_eager-future2}";
      patches = [];
      lisp_dependencies = "${lisp_eos} ${lisp_trivial-garbage} ${lisp_bordeaux-threads}";
      name = "lisp_test-eager-future2-0.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
