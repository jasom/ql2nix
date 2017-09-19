
{ buildLispPackage, stdenv, fetchurl, lisp-project_generators, 
   lisp_iterate, lisp_cl-cont,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_cl-cont  ];
      inherit stdenv;
      systemName = "generators";
      
      sourceProject = "${lisp-project_generators}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_cl-cont}";
      name = "lisp_generators-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
