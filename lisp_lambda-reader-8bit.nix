
{ buildLispPackage, stdenv, fetchurl, lisp-project_lambda-reader, 
   lisp_named-readtables, lisp_asdf-encodings,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_asdf-encodings  ];
      inherit stdenv;
      systemName = "lambda-reader-8bit";
      
      sourceProject = "${lisp-project_lambda-reader}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_asdf-encodings}";
      name = "lisp_lambda-reader-8bit-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
