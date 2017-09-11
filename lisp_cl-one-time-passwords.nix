
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-one-time-passwords, 
   lisp_ironclad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad  ];
      inherit stdenv;
      systemName = "cl-one-time-passwords";
      
      sourceProject = "${lisp-project_cl-one-time-passwords}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad}";
      name = "lisp_cl-one-time-passwords-20130420-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
