
{ buildLispPackage, stdenv, fetchurl, lisp-project_simpsamp, 
   lisp_jpl-util,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_jpl-util  ];
      inherit stdenv;
      systemName = "simpsamp";
      
      sourceProject = "${lisp-project_simpsamp}";
      patches = [];
      lisp_dependencies = "${lisp_jpl-util}";
      name = "lisp_simpsamp-0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
