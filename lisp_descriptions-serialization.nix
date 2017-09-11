
{ buildLispPackage, stdenv, fetchurl, lisp-project_descriptions, 
   lisp_cl-json, lisp_descriptions,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_descriptions  ];
      inherit stdenv;
      systemName = "descriptions.serialization";
      
      sourceProject = "${lisp-project_descriptions}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_descriptions}";
      name = "lisp_descriptions-serialization-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
