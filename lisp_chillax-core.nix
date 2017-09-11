
{ buildLispPackage, stdenv, fetchurl, lisp-project_chillax, 
   lisp_alexandria, lisp_drakma, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_drakma lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "chillax.core";
      
      sourceProject = "${lisp-project_chillax}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_drakma} ${lisp_flexi-streams}";
      name = "lisp_chillax-core-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
