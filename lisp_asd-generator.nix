
{ buildLispPackage, stdenv, fetchurl, lisp-project_asd-generator, 
   lisp_iterate, lisp_cl-fad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_cl-fad  ];
      inherit stdenv;
      systemName = "asd-generator";
      
      sourceProject = "${lisp-project_asd-generator}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_cl-fad}";
      name = "lisp_asd-generator-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
