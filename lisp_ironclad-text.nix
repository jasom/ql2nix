
{ buildLispPackage, stdenv, fetchurl, lisp-project_ironclad, 
   lisp_flexi-streams, lisp_nibbles,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_nibbles  ];
      inherit stdenv;
      systemName = "ironclad-text";
      
      sourceProject = "${lisp-project_ironclad}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_nibbles}";
      name = "lisp_ironclad-text-v0.34";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
