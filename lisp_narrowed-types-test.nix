
{ buildLispPackage, stdenv, fetchurl, lisp-project_narrowed-types, 
   lisp_rt,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rt  ];
      inherit stdenv;
      systemName = "narrowed-types-test";
      
      sourceProject = "${lisp-project_narrowed-types}";
      patches = [];
      lisp_dependencies = "${lisp_rt}";
      name = "lisp_narrowed-types-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
