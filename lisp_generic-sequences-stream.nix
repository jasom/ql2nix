
{ buildLispPackage, stdenv, fetchurl, lisp-project_generic-sequences, 
   lisp_bordeaux-threads, lisp_generic-sequences,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_generic-sequences  ];
      inherit stdenv;
      systemName = "generic-sequences-stream";
      
      sourceProject = "${lisp-project_generic-sequences}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_generic-sequences}";
      name = "lisp_generic-sequences-stream-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }