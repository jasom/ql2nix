
{ buildLispPackage, stdenv, fetchurl, lisp-project_image, 
   lisp_gzip-stream, lisp_zpng, lisp_skippy,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gzip-stream lisp_zpng lisp_skippy  ];
      inherit stdenv;
      systemName = "image";
      
      sourceProject = "${lisp-project_image}";
      patches = [];
      lisp_dependencies = "${lisp_gzip-stream} ${lisp_zpng} ${lisp_skippy}";
      name = "lisp_image-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
