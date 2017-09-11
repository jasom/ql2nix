
{ buildLispPackage, stdenv, fetchurl, lisp-project_read-number, 
   lisp_alexandria, lisp_lisp-unit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "read-number";
      
      sourceProject = "${lisp-project_read-number}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_lisp-unit}";
      name = "lisp_read-number-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
