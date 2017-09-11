
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-random-forest, 
   lisp_cl-random-forest, lisp_prove, lisp_prove-asdf, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-random-forest lisp_prove lisp_prove-asdf lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-random-forest-test";
      
      sourceProject = "${lisp-project_cl-random-forest}";
      patches = [];
      lisp_dependencies = "${lisp_cl-random-forest} ${lisp_prove} ${lisp_prove-asdf} ${lisp_trivial-garbage}";
      name = "lisp_cl-random-forest-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
