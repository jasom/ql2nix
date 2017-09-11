
{ buildLispPackage, stdenv, fetchurl, lisp-project_easing, 
   lisp_easing, lisp_sketch,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_easing lisp_sketch  ];
      inherit stdenv;
      systemName = "easing-demo";
      
      sourceProject = "${lisp-project_easing}";
      patches = [];
      lisp_dependencies = "${lisp_easing} ${lisp_sketch}";
      name = "lisp_easing-demo-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
