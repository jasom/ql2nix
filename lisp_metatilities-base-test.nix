
{ buildLispPackage, stdenv, fetchurl, lisp-project_metatilities-base, 
   lisp_lift, lisp_metatilities-base,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "metatilities-base-test";
      
      sourceProject = "${lisp-project_metatilities-base}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_metatilities-base}";
      name = "lisp_metatilities-base-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
