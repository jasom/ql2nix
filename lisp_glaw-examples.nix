
{ buildLispPackage, stdenv, fetchurl, lisp-project_glaw, 
   lisp_glaw, lisp_glop, lisp_glaw-imago,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glaw lisp_glop lisp_glaw-imago  ];
      inherit stdenv;
      systemName = "glaw-examples";
      
      sourceProject = "${lisp-project_glaw}";
      patches = [];
      lisp_dependencies = "${lisp_glaw} ${lisp_glop} ${lisp_glaw-imago}";
      name = "lisp_glaw-examples-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
