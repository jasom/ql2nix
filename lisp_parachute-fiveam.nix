
{ buildLispPackage, stdenv, fetchurl, lisp-project_parachute, 
   lisp_parachute,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parachute  ];
      inherit stdenv;
      systemName = "parachute-fiveam";
      
      sourceProject = "${lisp-project_parachute}";
      patches = [];
      lisp_dependencies = "${lisp_parachute}";
      name = "lisp_parachute-fiveam-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
