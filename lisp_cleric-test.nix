
{ buildLispPackage, stdenv, fetchurl, lisp-project_cleric, 
   lisp_cleric, lisp_erlang-term-test, lisp_fiveam, lisp_flexi-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cleric lisp_erlang-term-test lisp_fiveam lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "cleric-test";
      
      sourceProject = "${lisp-project_cleric}";
      patches = [];
      lisp_dependencies = "${lisp_cleric} ${lisp_erlang-term-test} ${lisp_fiveam} ${lisp_flexi-streams}";
      name = "lisp_cleric-test-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
