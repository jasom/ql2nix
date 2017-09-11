
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-generic-arithmetic, 
   lisp_conduit-packages,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_conduit-packages  ];
      inherit stdenv;
      systemName = "cl-generic-arithmetic";
      
      sourceProject = "${lisp-project_cl-generic-arithmetic}";
      patches = [];
      lisp_dependencies = "${lisp_conduit-packages}";
      name = "lisp_cl-generic-arithmetic-20130720-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
