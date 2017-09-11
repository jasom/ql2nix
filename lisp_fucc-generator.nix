
{ buildLispPackage, stdenv, fetchurl, lisp-project_fucc, 
   lisp_fucc-parser,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fucc-parser  ];
      inherit stdenv;
      systemName = "fucc-generator";
      
      sourceProject = "${lisp-project_fucc}";
      patches = [];
      lisp_dependencies = "${lisp_fucc-parser}";
      name = "lisp_fucc-generator_0.2.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
