
{ buildLispPackage, stdenv, fetchurl, lisp-project_find-port, 
   lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket  ];
      inherit stdenv;
      systemName = "find-port";
      
      sourceProject = "${lisp-project_find-port}";
      patches = [];
      lisp_dependencies = "${lisp_usocket}";
      name = "lisp_find-port-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
