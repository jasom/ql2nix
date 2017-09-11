
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-sl4a, 
   lisp_cl-json, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-android";
      
      sourceProject = "${lisp-project_cl-sl4a}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_usocket}";
      name = "lisp_cl-android-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
