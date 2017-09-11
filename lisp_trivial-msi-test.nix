
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-msi, 
   lisp_fiveam, lisp_trivial-msi,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivial-msi  ];
      inherit stdenv;
      systemName = "trivial-msi-test";
      
      sourceProject = "${lisp-project_trivial-msi}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivial-msi}";
      name = "lisp_trivial-msi-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
