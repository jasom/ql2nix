
{ buildLispPackage, stdenv, fetchurl, lisp-project_swap-bytes, 
   lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-features  ];
      inherit stdenv;
      systemName = "swap-bytes";
      
      sourceProject = "${lisp-project_swap-bytes}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-features}";
      name = "lisp_swap-bytes-v1.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
