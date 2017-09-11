
{ buildLispPackage, stdenv, fetchurl, lisp-project_file-local-variable, 
   lisp_file-local-variable, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_file-local-variable lisp_fiveam  ];
      inherit stdenv;
      systemName = "file-local-variable.test";
      
      sourceProject = "${lisp-project_file-local-variable}";
      patches = [];
      lisp_dependencies = "${lisp_file-local-variable} ${lisp_fiveam}";
      name = "lisp_file-local-variable-test-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
