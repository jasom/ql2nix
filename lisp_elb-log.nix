
{ buildLispPackage, stdenv, fetchurl, lisp-project_elb-log, 
   lisp_local-time, lisp_zs3, lisp_cl-annot-prove, lisp_cl-annot, lisp_cl-syntax-interpol, lisp_cl-syntax,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_zs3 lisp_cl-annot-prove lisp_cl-annot lisp_cl-syntax-interpol lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "elb-log";
      
      sourceProject = "${lisp-project_elb-log}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_zs3} ${lisp_cl-annot-prove} ${lisp_cl-annot} ${lisp_cl-syntax-interpol} ${lisp_cl-syntax}";
      name = "lisp_elb-log-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
