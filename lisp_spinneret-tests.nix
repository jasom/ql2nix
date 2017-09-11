
{ buildLispPackage, stdenv, fetchurl, lisp-project_spinneret, 
   lisp_cl-markdown, lisp_fiveam, lisp_serapeum, lisp_spinneret,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-markdown lisp_fiveam lisp_serapeum lisp_spinneret  ];
      inherit stdenv;
      systemName = "spinneret/tests";
      
      sourceProject = "${lisp-project_spinneret}";
      patches = [];
      lisp_dependencies = "${lisp_cl-markdown} ${lisp_fiveam} ${lisp_serapeum} ${lisp_spinneret}";
      name = "lisp_spinneret-tests-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
