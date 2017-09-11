
{ buildLispPackage, stdenv, fetchurl, lisp-project_static-vectors, 
   lisp_fiveam, lisp_static-vectors,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_static-vectors  ];
      inherit stdenv;
      systemName = "static-vectors/test";
      
      sourceProject = "${lisp-project_static-vectors}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_static-vectors}";
      name = "lisp_static-vectors-test-v1.8.2";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
