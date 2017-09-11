
{ buildLispPackage, stdenv, fetchurl, lisp-project_birch, 
   lisp_birch, lisp_flexi-streams, lisp_prove,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_birch lisp_flexi-streams lisp_prove  ];
      inherit stdenv;
      systemName = "birch.test";
      
      sourceProject = "${lisp-project_birch}";
      patches = [];
      lisp_dependencies = "${lisp_birch} ${lisp_flexi-streams} ${lisp_prove}";
      name = "lisp_birch-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
