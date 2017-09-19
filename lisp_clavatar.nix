
{ buildLispPackage, stdenv, fetchurl, lisp-project_clavatar, 
   lisp_drakma, lisp_ironclad, lisp_iolib,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_ironclad lisp_iolib  ];
      inherit stdenv;
      systemName = "clavatar";
      
      sourceProject = "${lisp-project_clavatar}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_ironclad} ${lisp_iolib}";
      name = "lisp_clavatar-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
