
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-random-forest, 
   lisp_alexandria, lisp_cl-online-learning, lisp_lparallel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-online-learning lisp_lparallel  ];
      inherit stdenv;
      systemName = "cl-random-forest";
      
      sourceProject = "${lisp-project_cl-random-forest}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-online-learning} ${lisp_lparallel}";
      name = "lisp_cl-random-forest-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
