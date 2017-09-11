
{ buildLispPackage, stdenv, fetchurl, lisp-project_infix-dollar-reader, 
   lisp_infix-dollar-reader, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_infix-dollar-reader lisp_rt  ];
      inherit stdenv;
      systemName = "infix-dollar-reader-test";
      
      sourceProject = "${lisp-project_infix-dollar-reader}";
      patches = [];
      lisp_dependencies = "${lisp_infix-dollar-reader} ${lisp_rt}";
      name = "lisp_infix-dollar-reader-test-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
