
{ buildLispPackage, stdenv, fetchurl, lisp-project_asd-generator, 
   lisp_alexandria, lisp_cl-fad, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-fad lisp_iterate  ];
      inherit stdenv;
      systemName = "asd-generator";
      
      sourceProject = "${lisp-project_asd-generator}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-fad} ${lisp_iterate}";
      name = "lisp_asd-generator-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
