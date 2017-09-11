
{ buildLispPackage, stdenv, fetchurl, lisp-project_swap-bytes, 
   lisp_fiveam, lisp_swap-bytes,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_swap-bytes  ];
      inherit stdenv;
      systemName = "swap-bytes/test";
      
      sourceProject = "${lisp-project_swap-bytes}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_swap-bytes}";
      name = "lisp_swap-bytes-test-v1.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
