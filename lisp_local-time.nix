
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-time, 
   lisp_cl-fad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad  ];
      inherit stdenv;
      systemName = "local-time";
      
      sourceProject = "${lisp-project_local-time}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad}";
      name = "lisp_local-time-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
