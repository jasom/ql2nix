
{ buildLispPackage, stdenv, fetchurl, lisp-project_vgplot, 
   lisp_cl-fad, lisp_cl-ppcre, lisp_ltk,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre lisp_ltk  ];
      inherit stdenv;
      systemName = "vgplot";
      
      sourceProject = "${lisp-project_vgplot}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_ltk}";
      name = "lisp_vgplot-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
