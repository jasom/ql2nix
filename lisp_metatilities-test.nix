
{ buildLispPackage, stdenv, fetchurl, lisp-project_metatilities, 
   lisp_lift, lisp_metatilities,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_metatilities  ];
      inherit stdenv;
      systemName = "metatilities-test";
      
      sourceProject = "${lisp-project_metatilities}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_metatilities}";
      name = "lisp_metatilities-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
