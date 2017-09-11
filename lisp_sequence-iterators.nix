
{ buildLispPackage, stdenv, fetchurl, lisp-project_sequence-iterators, 
   lisp_parse-declarations-1-0,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-declarations-1-0  ];
      inherit stdenv;
      systemName = "sequence-iterators";
      
      sourceProject = "${lisp-project_sequence-iterators}";
      patches = [];
      lisp_dependencies = "${lisp_parse-declarations-1-0}";
      name = "lisp_sequence-iterators-20130813-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
