
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-qprint, 
   lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "cl-qprint";
      
      sourceProject = "${lisp-project_cl-qprint}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams}";
      name = "lisp_cl-qprint-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
