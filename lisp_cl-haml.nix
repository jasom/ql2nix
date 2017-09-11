
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-haml, 
   lisp_cl-who,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who  ];
      inherit stdenv;
      systemName = "cl-haml";
      
      sourceProject = "${lisp-project_cl-haml}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who}";
      name = "lisp_cl-haml-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
