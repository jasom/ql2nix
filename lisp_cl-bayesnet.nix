
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bayesnet, 
   lisp_cffi, lisp_trivial-shell, lisp_s-xml,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_trivial-shell lisp_s-xml  ];
      inherit stdenv;
      systemName = "cl-bayesnet";
      
      sourceProject = "${lisp-project_cl-bayesnet}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_trivial-shell} ${lisp_s-xml}";
      name = "lisp_cl-bayesnet-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
