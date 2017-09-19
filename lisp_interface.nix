
{ buildLispPackage, stdenv, fetchurl, lisp-project_interface, 
   lisp_global-vars, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_global-vars lisp_alexandria  ];
      inherit stdenv;
      systemName = "interface";
      
      sourceProject = "${lisp-project_interface}";
      patches = [];
      lisp_dependencies = "${lisp_global-vars} ${lisp_alexandria}";
      name = "lisp_interface-20151031-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
