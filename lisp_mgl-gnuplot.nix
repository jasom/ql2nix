
{ buildLispPackage, stdenv, fetchurl, lisp-project_mgl, 
   lisp_alexandria, lisp_external-program,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_external-program  ];
      inherit stdenv;
      systemName = "mgl-gnuplot";
      
      sourceProject = "${lisp-project_mgl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_external-program}";
      name = "lisp_mgl-gnuplot-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
