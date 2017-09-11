
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-manager, 
   lisp_asdf-manager, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-manager lisp_fiveam  ];
      inherit stdenv;
      systemName = "asdf-manager-test";
      
      sourceProject = "${lisp-project_asdf-manager}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-manager} ${lisp_fiveam}";
      name = "lisp_asdf-manager-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
