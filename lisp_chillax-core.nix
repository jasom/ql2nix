
{ buildLispPackage, stdenv, fetchurl, lisp-project_chillax, 
   lisp_drakma, lisp_flexi-streams, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_flexi-streams lisp_alexandria  ];
      inherit stdenv;
      systemName = "chillax.core";
      
      sourceProject = "${lisp-project_chillax}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_flexi-streams} ${lisp_alexandria}";
      name = "lisp_chillax-core-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
