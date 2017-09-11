
{ buildLispPackage, stdenv, fetchurl, lisp-project_parameterized-function, 
   lisp_interface,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_interface  ];
      inherit stdenv;
      systemName = "parameterized-function";
      
      sourceProject = "${lisp-project_parameterized-function}";
      patches = [];
      lisp_dependencies = "${lisp_interface}";
      name = "lisp_parameterized-function-20140914-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
