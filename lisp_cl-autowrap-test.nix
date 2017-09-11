
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-autowrap, 
   lisp_cl-autowrap,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-autowrap  ];
      inherit stdenv;
      systemName = "cl-autowrap-test";
      
      sourceProject = "${lisp-project_cl-autowrap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-autowrap}";
      name = "lisp_cl-autowrap-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
