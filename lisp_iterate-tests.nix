
{ buildLispPackage, stdenv, fetchurl, lisp-project_iterate, 
   lisp_iterate, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_rt  ];
      inherit stdenv;
      systemName = "iterate/tests";
      
      sourceProject = "${lisp-project_iterate}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_rt}";
      name = "lisp_iterate-tests-20160825-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
