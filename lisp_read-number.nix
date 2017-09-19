
{ buildLispPackage, stdenv, fetchurl, lisp-project_read-number, 
   lisp_lisp-unit, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit lisp_alexandria  ];
      inherit stdenv;
      systemName = "read-number";
      
      sourceProject = "${lisp-project_read-number}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit} ${lisp_alexandria}";
      name = "lisp_read-number-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
