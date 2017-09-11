
{ buildLispPackage, stdenv, fetchurl, lisp-project_torta, 
   lisp_gordon,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gordon  ];
      inherit stdenv;
      systemName = "torta";
      
      sourceProject = "${lisp-project_torta}";
      patches = [];
      lisp_dependencies = "${lisp_gordon}";
      name = "lisp_torta-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
