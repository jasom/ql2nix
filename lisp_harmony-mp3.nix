
{ buildLispPackage, stdenv, fetchurl, lisp-project_harmony, 
   lisp_cl-mpg123, lisp_harmony,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mpg123 lisp_harmony  ];
      inherit stdenv;
      systemName = "harmony-mp3";
      
      sourceProject = "${lisp-project_harmony}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mpg123} ${lisp_harmony}";
      name = "lisp_harmony-mp3-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
