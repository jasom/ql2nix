
{ buildLispPackage, stdenv, fetchurl, lisp-project_ironclad, 
   lisp_ironclad, lisp_flexi-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "ironclad-text";
      
      sourceProject = "${lisp-project_ironclad}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_flexi-streams}";
      name = "lisp_ironclad-text-v0.34";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
