
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-tco, 
   lisp_clunit, lisp_trivial-tco,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clunit lisp_trivial-tco  ];
      inherit stdenv;
      systemName = "trivial-tco-test";
      
      sourceProject = "${lisp-project_trivial-tco}";
      patches = [];
      lisp_dependencies = "${lisp_clunit} ${lisp_trivial-tco}";
      name = "lisp_trivial-tco-test-20131003-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
