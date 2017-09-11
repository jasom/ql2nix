
{ buildLispPackage, stdenv, fetchurl, lisp-project_ironclad, 
   lisp_nibbles,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_nibbles  ];
      inherit stdenv;
      systemName = "ironclad";
      
      sourceProject = "${lisp-project_ironclad}";
      patches = [];
      lisp_dependencies = "${lisp_nibbles}";
      name = "lisp_ironclad-v0.34";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
