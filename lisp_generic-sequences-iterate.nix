
{ buildLispPackage, stdenv, fetchurl, lisp-project_generic-sequences, 
   lisp_generic-sequences, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_generic-sequences lisp_iterate  ];
      inherit stdenv;
      systemName = "generic-sequences-iterate";
      
      sourceProject = "${lisp-project_generic-sequences}";
      patches = [];
      lisp_dependencies = "${lisp_generic-sequences} ${lisp_iterate}";
      name = "lisp_generic-sequences-iterate-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
