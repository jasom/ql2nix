
{ buildLispPackage, stdenv, fetchurl, lisp-project_glaw, 
   lisp_glaw, lisp_imago,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glaw lisp_imago  ];
      inherit stdenv;
      systemName = "glaw-imago";
      
      sourceProject = "${lisp-project_glaw}";
      patches = [];
      lisp_dependencies = "${lisp_glaw} ${lisp_imago}";
      name = "lisp_glaw-imago-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
