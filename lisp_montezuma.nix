
{ buildLispPackage, stdenv, fetchurl, lisp-project_montezuma, 
   lisp_cl-ppcre, lisp_cl-fad, lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-fad lisp_babel  ];
      inherit stdenv;
      systemName = "montezuma";
      
      sourceProject = "${lisp-project_montezuma}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-fad} ${lisp_babel}";
      name = "lisp_montezuma-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
