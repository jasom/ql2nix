
{ buildLispPackage, stdenv, fetchurl, lisp-project_image, 
   lisp_flexi-streams, lisp_gzip-stream, lisp_skippy, lisp_zpng,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_gzip-stream lisp_skippy lisp_zpng  ];
      inherit stdenv;
      systemName = "image";
      
      sourceProject = "${lisp-project_image}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_gzip-stream} ${lisp_skippy} ${lisp_zpng}";
      name = "lisp_image-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
