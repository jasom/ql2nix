
{ buildLispPackage, stdenv, fetchurl, lisp-project_sketch, 
   lisp_alexandria, lisp_sketch,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_sketch  ];
      inherit stdenv;
      systemName = "sketch-examples";
      
      sourceProject = "${lisp-project_sketch}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_sketch}";
      name = "lisp_sketch-examples-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
