
{ buildLispPackage, stdenv, fetchurl, lisp-project_parachute, 
   lisp_parachute, lisp_cl-ppcre,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parachute lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "parachute-prove";
      
      sourceProject = "${lisp-project_parachute}";
      patches = [];
      lisp_dependencies = "${lisp_parachute} ${lisp_cl-ppcre}";
      name = "lisp_parachute-prove-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
