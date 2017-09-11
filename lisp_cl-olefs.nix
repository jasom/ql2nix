
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-olefs, 
   lisp_ieee-floats,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ieee-floats  ];
      inherit stdenv;
      systemName = "cl-olefs";
      
      sourceProject = "${lisp-project_cl-olefs}";
      patches = [];
      lisp_dependencies = "${lisp_ieee-floats}";
      name = "lisp_cl-olefs-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
