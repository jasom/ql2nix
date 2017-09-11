
{ buildLispPackage, stdenv, fetchurl, lisp-project_sequence-iterators, 
   lisp_sequence-iterators,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_sequence-iterators  ];
      inherit stdenv;
      systemName = "extensible-sequences";
      
      sourceProject = "${lisp-project_sequence-iterators}";
      patches = [];
      lisp_dependencies = "${lisp_sequence-iterators}";
      name = "lisp_extensible-sequences-20130813-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
