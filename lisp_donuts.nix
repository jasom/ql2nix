
{ buildLispPackage, stdenv, fetchurl, lisp-project_donuts, 
   lisp_trivial-shell, lisp_cl-ppcre,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-shell lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "donuts";
      
      sourceProject = "${lisp-project_donuts}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-shell} ${lisp_cl-ppcre}";
      name = "lisp_donuts-20120703-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
