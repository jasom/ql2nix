
{ buildLispPackage, stdenv, fetchurl, lisp-project_temporal-functions, 
   lisp_macroexpand-dammit,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_macroexpand-dammit  ];
      inherit stdenv;
      systemName = "temporal-functions";
      
      sourceProject = "${lisp-project_temporal-functions}";
      patches = [];
      lisp_dependencies = "${lisp_macroexpand-dammit}";
      name = "lisp_temporal-functions-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
