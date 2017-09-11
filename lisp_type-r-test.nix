
{ buildLispPackage, stdenv, fetchurl, lisp-project_type-r, 
   lisp_fiveam, lisp_type-r,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_type-r  ];
      inherit stdenv;
      systemName = "type-r.test";
      
      sourceProject = "${lisp-project_type-r}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_type-r}";
      name = "lisp_type-r-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
