
{ buildLispPackage, stdenv, fetchurl, lisp-project_hermetic, 
   lisp_cl-pass, lisp_clack,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-pass lisp_clack  ];
      inherit stdenv;
      systemName = "hermetic";
      
      sourceProject = "${lisp-project_hermetic}";
      patches = [];
      lisp_dependencies = "${lisp_cl-pass} ${lisp_clack}";
      name = "lisp_hermetic-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
