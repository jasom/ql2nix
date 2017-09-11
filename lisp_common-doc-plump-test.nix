
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-doc-plump, 
   lisp_common-doc-plump, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-doc-plump lisp_fiveam  ];
      inherit stdenv;
      systemName = "common-doc-plump-test";
      
      sourceProject = "${lisp-project_common-doc-plump}";
      patches = [];
      lisp_dependencies = "${lisp_common-doc-plump} ${lisp_fiveam}";
      name = "lisp_common-doc-plump-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
