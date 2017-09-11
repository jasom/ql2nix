
{ buildLispPackage, stdenv, fetchurl, lisp-project_moptilities, 
   lisp_lift, lisp_moptilities,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_moptilities  ];
      inherit stdenv;
      systemName = "moptilities-test";
      
      sourceProject = "${lisp-project_moptilities}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_moptilities}";
      name = "lisp_moptilities-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
