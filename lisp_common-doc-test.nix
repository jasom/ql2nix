
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc, 
   lisp_common-doc, lisp_common-doc-contrib, lisp_fiveam,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc lisp_common-doc-contrib lisp_fiveam  ];
      inherit stdenv;
      systemName = "common-doc-test";
      
      sourceProject = "${lisp-project_common-doc}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc} ${lisp_common-doc-contrib} ${lisp_fiveam}";
      name = "lisp_common-doc-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
