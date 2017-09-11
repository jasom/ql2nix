
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-photo, 
   lisp_cl-photo, lisp_rt,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-photo lisp_rt  ];
      inherit stdenv;
      systemName = "cl-photo-tests";
      
      sourceProject = "${lisp-project_cl-photo}";
      patches = [];
      lisp_dependencies = "${lisp_cl-photo} ${lisp_rt}";
      name = "lisp_cl-photo-tests-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
