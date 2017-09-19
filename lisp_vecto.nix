
{ buildLispPackage, stdenv, fetchurl, lisp-project_vecto, 
   lisp_zpb-ttf, lisp_zpng, lisp_cl-vectors,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zpb-ttf lisp_zpng lisp_cl-vectors  ];
      inherit stdenv;
      systemName = "vecto";
      
      sourceProject = "${lisp-project_vecto}";
      patches = [];
      lisp_dependencies = "${lisp_zpb-ttf} ${lisp_zpng} ${lisp_cl-vectors}";
      name = "lisp_vecto-1.4.10";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
