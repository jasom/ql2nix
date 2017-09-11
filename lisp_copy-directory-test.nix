
{ buildLispPackage, stdenv, fetchurl, lisp-project_copy-directory, 
   lisp_copy-directory, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_copy-directory lisp_fiveam  ];
      inherit stdenv;
      systemName = "copy-directory-test";
      
      sourceProject = "${lisp-project_copy-directory}";
      patches = [];
      lisp_dependencies = "${lisp_copy-directory} ${lisp_fiveam}";
      name = "lisp_copy-directory-test-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
